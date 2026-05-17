from collections import defaultdict as d_dict
from typing import Dict, List, Tuple

Lump = Tuple[int, str, int]
# ^ (index, name, rank)


# NOTE: lumps can be part of multiple systems
# -- but implementation rating (Stage) is per game-lump pair


rank_colours = ("red", "mag", "blu", "grn", "ylw")
rank_names = ("Skipped", "Stub Hex", "Stub Struct", "Rough", "Robust")
# 0 | Skipped     | Red
# 1 | Stub Hex    | Magenta
# 2 | Stub Struct | Blue
# 3 | Rough       | Green
# 4 | Robust      | Gold


def colourise(text: str, colour: str = "wht") -> str:
    ansi_colour_code = {
        "blk": 30, "red": 31, "grn": 32, "ylw": 33,
        "blu": 34, "mag": 35, "cyn": 36, "wht": 37}
    return f"\x1b[{ansi_colour_code[colour]}m{text}\x1b[0m"


def score_lumps(lumps: List[Lump]) -> (int, List[int]):
    """mean_score should be 0..4 (NoneImplemented..AllRobust)"""
    totals = [0 for i in range(5)]
    if len(lumps) == 0:
        return 0, totals
    for index, name, stage in lumps:
        totals[stage] += 1
    mean_score = sum([t * i for i, t in enumerate(totals)]) / len(lumps)
    return mean_score, totals


def totals_str(totals: List[int]) -> str:
    global rank_colours
    return "-".join([
        colourise(f"{total:03d}", colour)
        for total, colour in reversed([*zip(totals, rank_colours)])])


# why do this instead of another score_lumps call?
def combined_score(scores: List[Tuple[int, List[int]]]) -> (int, List[int]):
    c_mean = 0
    c_totals = [0 for i in range(5)]
    for mean, totals in scores:
        c_mean += mean
        c_totals = [a + b for a, b in zip(c_totals, totals)]
    c_mean /= len(scores)
    return c_mean, c_totals


def print_summary(title: str, mean_score: int, totals: List[int], indent=0) -> str:
    print(("  " * indent) + f"{title:<24} {mean_score:1.2f} ({totals_str(totals)})")


# def list_lumps(rank_names: Dict[int, str], rank_colours: List[str], lumps: List[Lump]):
def list_lumps(lumps: List[Lump]):
    global rank_names
    global rank_colours
    # sorted by rank & name
    lumps = sorted(lumps, key=lambda x: (-x[2], x[1]))
    for (index, name, rank) in lumps:
        indent = "  " * 4
        line = f"{index:04X} {rank} {rank_names[rank]:<16} {name}"
        print(indent + colourise(line, rank_colours[rank]))


if __name__ == "__main__":
    import sqlite3
    import sys

    # process CLI args
    args = set(sys.argv[1:])

    verbose = False
    if any(v_flag in args for v_flag in ("-v", "--verbose")):
        verbose = True
        args -= {"--verbose", "-v"}

    if len(args) != 1:
        print("\n".join([
            f"USAGE: {sys.argv[0]} GAME",
            "  flags",
            "    --verbose, -v  list every lump"]))
        sys.exit(0)

    game = list(args)[0]
    assert game in ("r1", "r2", "r5")

    # load SQL database
    sql_files = ("base.sql", f"{game}.sql")
    db = sqlite3.connect(":memory:")
    for filename in sql_files:
        with open(filename) as sql_file:
            script_text = sql_file.read()
        try:
            db.executescript(script_text)
        except Exception as exc:
            print(f"!!! encountered an error loading {filename} !!!")
            raise exc
    # NOTE: we don't need to filter queries by game
    # -- since we only load the .sql for the target game

    # TODO: filter out empty domains & systems for this game

    all_lumps = db.execute("""
        SELECT L.index_d, L.name, L.stage
        FROM Lump AS L
        """).fetchall()

    tagged_lumps = db.execute("""
        SELECT S.domain, LS.system, L.index_d, L.name, L.stage
        FROM       Lump       AS  L
        INNER JOIN LumpSystem AS LS ON LS.game == L.game AND LS.lump == L.name
        INNER JOIN System     AS  S ON S.name == LS.system
        """).fetchall()

    domain_systems = d_dict(lambda: d_dict(list))
    # ^ {"domain": {"system": [(lump)]}}
    for domain, system, index, name, stage in sorted(tagged_lumps):
        domain_systems[domain][system].append((index, name, stage))

    grouped_lumps = {
        lump
        for domain, systems in domain_systems.items()
        for system, lumps in systems.items()
        for lump in lumps}

    # lumps without a domain / system
    ungrouped_lumps = set(all_lumps).difference(grouped_lumps)

    # calculate scores
    scores = {
        domain: {
            system: score_lumps(lumps)
            for system, lumps in systems.items()}
        for domain, systems in domain_systems.items()}

    # print stats
    print_summary("Overall", *score_lumps(all_lumps))
    for domain, system_scores in scores.items():
        print_summary(domain, *combined_score(system_scores.values()), indent=1)
        for system, (mean_score, totals) in system_scores.items():
            print_summary(system, mean_score, totals, indent=2)
            if verbose:
                list_lumps(domain_systems[domain][system])

    if len(ungrouped_lumps) > 0:
        print_summary("Other", *score_lumps(ungrouped_lumps), indent=1)
        if verbose:
            list_lumps(ungrouped_lumps)
