/// @description Insert description here
// You can write your code in this editor

event_inherited();
if (!under_eat) {
	depth = -y;
}

if (lastx > x) {
	image_xscale = 1;
} else if (lastx < x) {
	image_xscale = -1;
}

if (!place_free(x, y)) {
	x = x - (x - lastx) * 2; 
	y = y - (y - lasty) * 2;
}

if (!under_eat) {
	// Chase the slime.
	slime = instance_find(obj_slime, 0);
	var maxDist = alert_radius + slime.radius;
	var distSqr = (slime.xx - xx) * (slime.xx - xx) + (slime.yy - yy) * (slime.yy - yy);
	if (distSqr <= maxDist * maxDist) {
		alert_radius = 70;
		// Move to slime.
		var move_spd = 0.45;
		if (self.x > slime.x + 2) {
			self.x -= move_spd;
		} else if (self.x < slime.x - 2) {
			self.x += move_spd;
		}
	
		if (self.y > slime.y + 2) {
			self.y -= move_spd;
		} else if (self.y < slime.y - 2) {
			self.y += move_spd;
		}
		
		if (self.x < slime.x + 2) {
			image_xscale = 1;
		} else if (self.x > slime.x - 2) {
			image_xscale = -1;
		}
		
	} else {
		alert_radius = 50;
	}
	
	// Attack slime
	var maxDist = attack_radius + slime.radius;
	var distSqr = (slime.xx - xx) * (slime.xx - xx) + (slime.yy - yy) * (slime.yy - yy);
	if (distSqr <= maxDist * maxDist) {
		if (sprite_index != enemy_atk){
			audio_play_sound(swoosh, 10, false);
		}
		sprite_index = enemy_atk;
	} else {
		sprite_index = enemy_idle;
	}
}



dx = x;
dy = y;
cx = x;
cy = y;
xx = x;
yy = y;
lastx = x;
lasty = y;