/// @description Insert description here
// You can write your code in this editor
event_inherited();
draw_self();

if (is_singing) {
	draw_sprite_ext(spr_music, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 1);
}