var a = argument0;
var b = argument1;
var maxDist = a.radius + b.radius;
var distSqr = (b.xx - a.xx) * (b.xx - a.xx) + (b.yy - a.yy) * (b.yy - a.yy);
if (distSqr <= maxDist * maxDist) {
	return true;
} else {
	return false;
}