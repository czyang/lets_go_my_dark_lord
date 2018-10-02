/// @description Insert description here
// You can write your code in this editor

var obj_col;
for (var i = 0; i < instance_number(obj_custom_collision); i ++){
	obj_col[i] = instance_find(obj_custom_collision, i);
}

for (var i = 0; i < array_length_1d(obj_col); i++) {
	var e = obj_col[i];
	// Fast distance check
    if (e != self && abs(cx - e.cx) <= 20 && abs(cy - e.cy) <= 20) {
        // Real distance check
        var dist = sqrt((e.xx - xx) * (e.xx - xx) + (e.yy - yy) * (e.yy - yy));
        if (dist <= radius + e.radius) {
            var ang = arctan2(e.yy - yy, e.xx - xx);
            var force = 1;
            var repelPower = (radius + e.radius - dist) / (radius + e.radius);
            dx -= cos(ang) * repelPower * force;
            dy -= sin(ang) * repelPower * force;
			x = dx;
			y = dy;
			xx = dx;
			yy = dy;
			cx = dx;
			cy = dy;
            e.dx += cos(ang) * repelPower * force;
            e.dy += sin(ang) * repelPower * force;
			e.x = e.dx;
			e.y = e.dy;
			e.xx = e.dx;
			e.yy = e.dy;
			e.cx = e.dx;
			e.cy = e.dy;
        }
    }
}
