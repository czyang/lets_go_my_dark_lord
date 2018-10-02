/// @description keys
event_inherited();
depth = -y;

x = dx;
y = dy;

c_speed = 1;
has_key_down = false;
if (keyboard_check(vk_right) || keyboard_check(ord("D"))) {
	image_xscale = -1;
	x += c_speed;
	has_key_down = true;
}
if (keyboard_check(vk_left) || keyboard_check(ord("A"))) {
	image_xscale = 1;
	x -= c_speed;
	has_key_down = true;
}
if (keyboard_check(vk_up) || keyboard_check(ord("W"))) {
	y -= c_speed;
	has_key_down = true;
}
if (keyboard_check(vk_down) || keyboard_check(ord("S"))){
	y += c_speed;
	has_key_down = true;
}

if (has_key_down && !is_playing_move_sound) {
	audio_play_sound(snd_move1, 10, true);
	is_playing_move_sound = true;
} else if (!has_key_down && is_playing_move_sound) {
	audio_stop_sound(snd_move1);
	is_playing_move_sound = false;
}

if (!place_free(x, y)) {
	x = lastx;
	y = lasty;
}

if (keyboard_check(vk_space)) {
	if (is_singing == false) {
		audio_play_sound(snd_slime_song, 10, true);
	}
	is_singing = true;
} else {
	audio_stop_sound(snd_slime_song);
	is_singing = false;
}

dx = x;
dy = y;
cx = x;
cy = y;
xx = x;
yy = y;
lastx = x;
lasty = y;

