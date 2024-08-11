global.currentroom = room
if (room != room_water_undynehouse)
    room_persistent = true

if (room != room_tundra2)
{
	instance_create(0, 0, obj_fader)
}

room_goto(room_battle)
