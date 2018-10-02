/// @description Insert description here
event_inherited();

if (!is_start) {
	depth = -y;
}

if (!is_attack) {
	if (lastx > x) {
		image_xscale = 1;
	} else if (lastx < x) {
		image_xscale = -1;
	}
}

if (is_win == false) {
	var obj_eatable = undefined;
	for (var i = 0; i < instance_number(footman); i ++){
		obj_eatable[i] = instance_find(footman, i);
	}
	if (obj_eatable != undefined) {
		for (var i = 0; i < array_length_1d(obj_eatable); i++) {
			var e = obj_eatable[i];
			if(script_execute(overlap, self, e)) {
				if (is_attack == false) {
					audio_play_sound(snd_roar, 10, false);
				}
				sprite_index = d_attack;
				is_attack = true;
				attack_obj = e;
				e.under_eat = true;
				e.depth = depth + 1;
				if (e.x > x) {
					image_xscale = -1;
				} else if (e.x < x) {
					image_xscale = 1;
				}
				break;
			}
		}
	}
}

if (!is_win && is_attack) {
	if (image_index >= image_number - 1) {
		image_speed = -1;
		attack_start = true;
		instance_destroy(attack_obj, false);
		attack_obj = noone;
	} else if (image_index <= 1){
		if (attack_start) {
			// Stop attack;
			sprite_index = d_idle;
			image_speed = 1;
			is_attack = false;
			attack_start = false;
		}
		image_speed = 1;
	}
}

if (is_win) {
	if (image_index >= image_number - 1) {
		image_speed = 0;
		// Level end.
		if room_exists(room_next(room)) room_goto_next();
	}
}

if (is_start) {
	if (image_index <= 0) {
		image_speed = 1;
		is_start = false;
		sprite_index = d_idle;
		image_index =  random_range(0, 2);
		depth = -99999;
	}
}

if (keyboard_check(vk_space) && !is_win) {
	var suck_spd = 0.2;
	var slime = instance_find(obj_slime, 0);
	if (slime.x > x + 2) {
		x += suck_spd;
	} else if (slime.x < x - 2) {
		x -= suck_spd;
	}
	
	if (slime.y > y + 2) {
		y += suck_spd;
	} else if (slime.y < y - 2) {
		y -= suck_spd;
	}
}

if (!is_win){
	var alter = undefined;
	alter = instance_find(obj_alter, 0);
	if (alter != undefined && alter != noone) {
		var maxDist = radius;
		var distSqr = (alter.x - x) * (alter.x - x) + (alter.y - y) * (alter.y - y);
		if (distSqr <= maxDist * maxDist) {
			// Win
			sprite_index = swallow;
			is_win = true;
			depth = -1000;
		}
	}
}

if (is_win == false && !place_free(x, y)) {
	x = x - (x - lastx) * 2; 
	y = y - (y - lasty) * 2;
}

dx = x;
dy = y;
cx = x;
cy = y;
xx = x;
yy = y;
lastx = x;
lasty = y;
