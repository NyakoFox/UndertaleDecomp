if (global.faceemotion == 0 && sprite_index != spr_floweynice)
    sprite_index = spr_floweynice
if (global.faceemotion == 1 && sprite_index != spr_floweynicesideum)
    sprite_index = spr_floweynicesideum
if (global.faceemotion == 2 && sprite_index != spr_floweysassy)
    sprite_index = spr_floweysassy
if (global.faceemotion == 3 && sprite_index != spr_floweypissed)
    sprite_index = spr_floweypissed
if (global.faceemotion == 4 && sprite_index != spr_floweyevil)
    sprite_index = spr_floweyevil
if (global.faceemotion == 5 && sprite_index != spr_floweygrin)
    sprite_index = spr_floweygrin
if (global.faceemotion == 6 && sprite_index != spr_floweytoriel)
    sprite_index = spr_floweytoriel
if (global.faceemotion == 7 && sprite_index != spr_floweytoriel2)
    sprite_index = spr_floweytoriel2
if (global.faceemotion == 8 && sprite_index != spr_floweyplain)
    sprite_index = spr_floweyplain
if (global.faceemotion == 9 && sprite_index != spr_floweyglasses)
    sprite_index = spr_floweyglasses
if instance_exists(OBJ_WRITER)
{
    if (OBJ_WRITER.halt != 0)
    {
        image_speed = 0
        image_index = 0
    }
    else
        image_speed = 0.2
}
