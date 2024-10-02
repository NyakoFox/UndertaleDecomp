siner += 1

if (pause == 1)
{
    siner = 0
    x = parent.x
}
if (pause == 2)
    siner = 0

if (instance_exists(obj_slice) && !slice_existed) {
	old_sprite_index = sprite_index
	rising = false
	slice_existed = true
	image_speed = -0.5
	image_index = 6
	sprite_index = spr_flowey_riseanim
	draw = true
}

if (slice_existed)
{
	if (!instance_exists(obj_slice))
	{
		slice_existed = false
		image_speed = 0.5
		image_index = 0
		sprite_index = spr_flowey_riseanim
		rising = true
		draw = true
	}
	else
	{
		if image_index <= 1 {
			draw = false
		}
	}
}

if (rising)
{
	if image_index >= 6
	{
		sprite_index = old_sprite_index
		image_index = 0
		image_speed = 0
	}
}


var scale = 1 + abs(sin(siner / 30) * 0.1)
var yoff = sprite_height * scale


if (draw)
{
	draw_sprite_ext(sprite_index, image_index, x, y - yoff + sprite_height, image_xscale, image_yscale * scale, image_angle, image_blend, image_alpha)
}
