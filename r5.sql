INSERT INTO Lump(game, index_h, index_d, name, stage) VALUES
    ('r5', '0000',   0, 'ENTITIES',                       4),
    ('r5', '0001',   1, 'PLANES',                         3),  -- TODO: Portal Planes
    ('r5', '0002',   2, 'TEXTURE_DATA',                   4),
    ('r5', '0003',   3, 'VERTICES',                       4),
    ('r5', '0004',   4, 'LIGHTPROBE_PARENT_INFOS',        1),
    ('r5', '0005',   5, 'SHADOW_ENVIRONMENTS',            1),
    ('r5', '000E',  14, 'MODELS',                         4),
    ('r5', '000F',  15, 'SURFACE_NAMES',                  4),
    ('r5', '0010',  16, 'CONTENTS_MASKS',                 3),
    ('r5', '0011',  17, 'SURFACE_PROPERTIES',             3),
    ('r5', '0012',  18, 'BVH_NODES',                      3),  -- extremely rough
    ('r5', '0013',  19, 'BVH_LEAF_DATA',                  3),  -- not using all leaf types
    ('r5', '0014',  20, 'PACKED_VERTICES',                0),
    -- ('r5', '0015',  21, 'HEIGHTFIELDS',                   0),  -- unused
    -- ('r5', '0016',  22, 'HEIGHTFIELD_SAMPLES',            0),  -- unused
    ('r5', '0018',  24, 'ENTITY_PARTITIONS',              4),
    ('r5', '001E',  30, 'VERTEX_NORMALS',                 4),
    ('r5', '0023',  35, 'GAME_LUMP',                      3),
    ('r5', '0025',  37, 'UNKNOWN_37',                     1),
    ('r5', '0026',  38, 'UNKNOWN_38',                     1),
    ('r5', '0027',  39, 'UNKNOWN_39',                     1),
    ('r5', '0028',  40, 'PAKFILE',                        0),
    ('r5', '002A',  42, 'CUBEMAPS',                       1),
    -- ('r5', '002B',  43, 'CUBEMAPS_AMBIENT_RCP',           0),  -- season6
    -- ('r5', '002C',  44, 'WATER_BODIES',                   0),  -- season11
    -- ('r5', '002D',  45, 'WATER_BODY_CENTERS',             0),  -- season11
    -- ('r5', '002E',  46, 'WATER_BODY_VERTICES',            0),  -- season11
    -- ('r5', '002F',  47, 'WATER_BODY_INDICES',             0),  -- season11
    -- ('r5', '0030',  48, 'WAVE_DATA',                      0),  -- season11
    ('r5', '0036',  54, 'WORLD_LIGHTS',                   1),
    ('r5', '0037',  55, 'WORLD_LIGHT_PARENT_INFOS',       0),
    ('r5', '0047',  71, 'VERTEX_UNLIT',                   4),
    ('r5', '0048',  72, 'VERTEX_LIT_FLAT',                4),  -- unused
    ('r5', '0049',  73, 'VERTEX_LIT_BUMP',                4),
    ('r5', '004A',  74, 'VERTEX_UNLIT_TS',                4),
    ('r5', '004B',  75, 'VERTEX_BLINN_PHONG',             4),
    ('r5', '004F',  79, 'MESH_INDICES',                   4),
    ('r5', '0050',  80, 'MESHES',                         3),  -- merging & splitting could be better
    ('r5', '0051',  81, 'MESH_BOUNDS',                    4),
    ('r5', '0052',  82, 'MATERIAL_SORTS',                 4),
    ('r5', '0053',  83, 'LIGHTMAP_HEADERS',               1),
    ('r5', '0055',  85, 'TWEAK_LIGHTS',                   1),
    -- ('r5', '0061',  97, 'LIGHTMAP_DATA_UNKNOWN',          0),  -- season6
    ('r5', '0062',  98, 'LIGHTMAP_DATA_SKY',              1),
    ('r5', '0063',  99, 'CSM_AABB_NODES',                 1),
    ('r5', '0064', 100, 'CSM_OBJ_REFERENCES',             0),
    ('r5', '0065', 101, 'LIGHTPROBES',                    0),
    ('r5', '0066', 102, 'STATIC_PROP_LIGHTPROBE_INDICES', 0),
    ('r5', '0067', 103, 'LIGHTPROBE_TREE',                0),
    ('r5', '0068', 104, 'LIGHTPROBE_REFERENCES',          0),
    ('r5', '0069', 105, 'LIGHTMAP_DATA_REAL_TIME_LIGHTS', 0),
    ('r5', '006A', 106, 'CELL_BSP_NODES',                 2),
    ('r5', '006B', 107, 'CELLS',                          2),
    ('r5', '006C', 108, 'PORTALS',                        2),
    ('r5', '006D', 109, 'PORTAL_VERTICES',                2),
    ('r5', '006E', 110, 'PORTAL_EDGES',                   2),
    ('r5', '006F', 111, 'PORTAL_VERTEX_EDGES',            2),
    ('r5', '0070', 112, 'PORTAL_VERTEX_REFERENCES',       2),
    ('r5', '0071', 113, 'PORTAL_EDGE_REFERENCES',         2),
    ('r5', '0072', 114, 'PORTAL_EDGE_INTERSECT_EDGE',     2),
    ('r5', '0073', 115, 'PORTAL_EDGE_INTERSECT_VERTEX',   2),
    ('r5', '0074', 116, 'PORTAL_EDGE_INTERSECT_HEADER',   2),
    ('r5', '0075', 117, 'OCCLUSION_MESH_VERTICES',        4),
    ('r5', '0076', 118, 'OCCLUSION_MESH_INDICES',         4),
    ('r5', '0077', 119, 'CELL_AABB_NODES',                3),  -- might need a revisit
    ('r5', '0078', 120, 'OBJ_REFERENCES',                 3),
    ('r5', '0079', 121, 'OBJ_REFERENCE_BOUNDS',           3),
    ('r5', '007A', 122, 'LIGHTMAP_DATA_RTL_PAGES',        1),
    ('r5', '007B', 123, 'LEVEL_INFO',                     3),
    ('r5', '007C', 124, 'SHADOW_MESH_OPAQUE_VERTICES',    0),
    ('r5', '007D', 125, 'SHADOW_MESH_ALPHA_VERTICES',     0),
    ('r5', '007E', 126, 'SHADOW_MESH_INDICES',            0),
    ('r5', '007F', 127, 'SHADOW_MESHES',                  0);


INSERT INTO LumpSystem(game, system, lump) VALUES
    -- BVH
    ('r5', 'BVH', 'BVH_LEAF_DATA'),
    ('r5', 'BVH', 'BVH_NODES'),
    ('r5', 'BVH', 'CONTENTS_MASKS'),
    ('r5', 'BVH', 'PACKED_VERTICES'),  -- iirc
    ('r5', 'BVH', 'SURFACE_PROPERTIES'),
    -- Cascading Shadow Maps
    ('r5', 'Cascading Shadow Maps', 'CSM_AABB_NODES'),
    ('r5', 'Cascading Shadow Maps', 'CSM_OBJ_REFERENCES'),
    -- Cell-Portal BSP Tree
    ('r5', 'Cell-Portal BSP Tree', 'CELLS'),
    ('r5', 'Cell-Portal BSP Tree', 'CELL_BSP_NODES'),
    ('r5', 'Cell-Portal BSP Tree', 'PLANES'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTALS'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTAL_EDGES'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTAL_EDGE_INTERSECT_EDGE'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTAL_EDGE_INTERSECT_HEADER'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTAL_EDGE_INTERSECT_VERTEX'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTAL_EDGE_REFERENCES'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTAL_VERTEX_EDGES'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTAL_VERTEX_REFERENCES'),
    ('r5', 'Cell-Portal BSP Tree', 'PORTAL_VERTICES'),
    ('r5', 'Cell-Portal BSP Tree', 'TEXTURE_DATA'),
    -- Lightmaps
    ('r5', 'Lightmaps', 'LIGHTMAP_DATA_REAL_TIME_LIGHTS'),
    ('r5', 'Lightmaps', 'LIGHTMAP_DATA_RTL_PAGES'),
    ('r5', 'Lightmaps', 'LIGHTMAP_DATA_SKY'),
    -- ('r5', 'Lightmaps', 'LIGHTMAP_DATA_UNKNOWN'),  -- season 6
    ('r5', 'Lightmaps', 'LIGHTMAP_HEADERS'),
    -- LightProbes
    ('r5', 'Lightprobes', 'LIGHTPROBES'),
    ('r5', 'Lightprobes', 'LIGHTPROBE_PARENT_INFOS'),
    ('r5', 'Lightprobes', 'LIGHTPROBE_REFERENCES'),
    ('r5', 'Lightprobes', 'LIGHTPROBE_TREE'),
    ('r5', 'Lightprobes', 'STATIC_PROP_LIGHTPROBE_INDICES'),
    -- Models
    ('r5', 'Models', 'MATERIAL_SORTS'),
    ('r5', 'Models', 'MESHES'),
    ('r5', 'Models', 'MESH_BOUNDS'),
    ('r5', 'Models', 'MESH_INDICES'),
    ('r5', 'Models', 'MODELS'),
    ('r5', 'Models', 'SURFACE_NAMES'),
    ('r5', 'Models', 'TEXTURE_DATA'),
    ('r5', 'Models', 'VERTEX_BLINN_PHONG'),
    ('r5', 'Models', 'VERTEX_LIT_BUMP'),
    ('r5', 'Models', 'VERTEX_LIT_FLAT'),
    ('r5', 'Models', 'VERTEX_NORMALS'),
    ('r5', 'Models', 'VERTEX_UNLIT'),
    ('r5', 'Models', 'VERTEX_UNLIT_TS'),
    ('r5', 'Models', 'VERTICES'),
    -- ObjReferences
    ('r5', 'ObjReferences', 'CELL_AABB_NODES'),
    ('r5', 'ObjReferences', 'OBJ_REFERENCES'),
    ('r5', 'ObjReferences', 'OBJ_REFERENCE_BOUNDS'),
    -- ShadowMeshes
    ('r5', 'ShadowMeshes', 'MATERIAL_SORTS'),
    ('r5', 'ShadowMeshes', 'SHADOW_ENVIRONMENTS'),
    ('r5', 'ShadowMeshes', 'SHADOW_MESHES'),
    ('r5', 'ShadowMeshes', 'SHADOW_MESH_ALPHA_VERTICES'),
    ('r5', 'ShadowMeshes', 'SHADOW_MESH_INDICES'),
    ('r5', 'ShadowMeshes', 'SHADOW_MESH_OPAQUE_VERTICES'),
    -- WaterBodies (season11)
    -- ('r5', 'WaterBodies', 'WATER_BODIES'),
    -- ('r5', 'WaterBodies', 'WATER_BODY_CENTERS'),
    -- ('r5', 'WaterBodies', 'WATER_BODY_INDICES'),
    -- ('r5', 'WaterBodies', 'WATER_BODY_VERTICES'),
    -- ('r5', 'WaterBodies', 'WAVE_DATA'),
    -- Worldlights
    ('r5', 'WorldLights', 'TWEAK_LIGHTS'),  -- unsure, but must be lighting related
    ('r5', 'WorldLights', 'WORLD_LIGHTS'),
    ('r5', 'WorldLights', 'WORLD_LIGHT_PARENT_INFOS');
