/// @description draw shaodw and obj
// draw_sprite(lord_shadow, image_index, x, y)
event_inherited();

draw_sprite_ext(lord_shadow, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, 0.4);
draw_self();