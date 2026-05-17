CREATE TABLE IF NOT EXISTS Stage (
    rating       INTEGER  NOT NULL  UNIQUE,
    name         VARCHAR  NOT NULL  UNIQUE,
    description  VARCHAR
);

INSERT INTO Stage(rating, name, description) VALUES
    (0, 'Skipped',       'nothing yet, might need more research'),
    (1, 'Stub (Hex)',    'copy-pasted bytes from an official map'),
    (2, 'Stub (Struct)', 'hand-crafted placeholder w/ structs'),
    (3, 'Rough',         'quick & dirty solution'),
    (4, 'Robust',        'well thought-out solution');


CREATE TABLE IF NOT EXISTS Game (
    short_name  VARCHAR  NOT NULL  UNIQUE,
    name        VARCHAR  NOT NULL  UNIQUE,
    version     INTEGER  NOT NULL  UNIQUE,  -- rBSP version
    branch      VARCHAR  NOT NULL  UNIQUE   -- bsp_tool tag
);

INSERT INTO Game(short_name, name, version, branch) VALUES
    ('r1', 'Titanfall',    29, 'titanfall'),
    ('r2', 'Titanfall 2',  37, 'titanfall2'),
    ('r5', 'Apex Legends', 47, 'apex_legends');


CREATE TABLE IF NOT EXISTS Lump (
    game     VARCHAR       NOT NULL,
    index_h  CHARACTER(4)  NOT NULL,
    index_d  INTEGER       NOT NULL,
    name     VARCHAR       NOT NULL,
    stage    INTEGER,
    FOREIGN KEY (game)  REFERENCES Game(short_name),
    FOREIGN KEY (stage) REFERENCES Stage(rating)
);


-- TODO: link git/github items to each lump
-- issues, projects, commits, research threads etc.

-- TODO: LumpNote FK(game, lump_name) + notes


-- System Groups
CREATE TABLE IF NOT EXISTS Domain (
    name  VARCHAR  NOT NULL  UNIQUE
);

INSERT INTO Domain(name) VALUES
    ('Lighting'),
    ('Physics'),
    ('Rendering'),
    ('Visibility');


CREATE TABLE IF NOT EXISTS System (
    domain  VARCHAR  NOT NULL,
    name    VARCHAR  NOT NULL  UNIQUE,
    FOREIGN KEY (domain) REFERENCES Domain(name)
);

INSERT INTO System(domain, name) VALUES
    ('Lighting',   'Lightmaps'),  -- baked for static objects
    ('Lighting',   'Lightprobes'),  -- cached for dynamic objects?
    ('Lighting',   'WorldLights'),  -- cached for dynamic objects?
    ('Physics',    'Brushes'),
    ('Physics',    'BVH'),  -- r5 only
    ('Physics',    'ClipModel'),  -- lookup table
    ('Physics',    'TriColl'),
    ('Rendering',  'Cascading Shadow Maps'),
    ('Rendering',  'Models'),  -- Models, Meshes
    ('Rendering',  'ObjReferences'),  -- or is this VIS?
    ('Rendering',  'ShadowMeshes'),
    -- ('Rendering', 'WaterBodies'),  -- r5 season11
    ('Visibility', 'Cell-Portal BSP Tree');


CREATE TABLE IF NOT EXISTS LumpSystem (
    game        VARCHAR  NOT NULL,
    system      VARCHAR  NOT NULL,
    lump        VARCHAR  NOT NULL,
    FOREIGN KEY (game, lump)  REFERENCES Lump(game, name),
    FOREIGN KEY (system)      REFERENCES System(name)
);
