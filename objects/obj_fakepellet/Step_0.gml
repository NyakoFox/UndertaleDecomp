var x_ = obj_floweybattle1.x + obj_floweybattle1.sprite_width / 2
var y_ = obj_floweybattle1.ystart + obj_floweybattle1.sprite_height / 2


if (attackyou == 1)
{
    move_towards_point(x_, y_, 0.5)
    depth = -500
    attackyou = 2
    friction = -0.004
}

if distance_to_point(x_, y_) < 20 {
	with (obj_fakepellet) instance_destroy()
	obj_floweybattle1.conversation = 999
}
