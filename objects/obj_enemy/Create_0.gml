// Movement
move_speed = 0.7;
chase_speed = 1.0;
walk_anim_speed = 1;

// Detection
detect_range = 80;
lose_range = 120;

// State
is_chasing = false;

// Facing: 0 = down, 1 = up, 2 = right, 3 = left
facing = 0;

// Collision tilemap
tilemap = layer_tilemap_get_id("Obstacles");

// Patrol path
patrol_path = Path1;
patrol_speed = move_speed;
patrol_started = false;

// Start sprite
sprite_index = nikyar_s;
image_speed = 0;
image_index = 0;

