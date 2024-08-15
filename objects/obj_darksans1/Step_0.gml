if (conversation == 0)
{
    if (x >= (obj_mainchara.x - 23))
    {
        x = (obj_mainchara.x - 23)
        hspeed = 0
        image_speed = 0
        conversation = 1
        global.typer = 21
        global.facechoice = 0
        global.faceemotion = 0
        global.msc = 0
        image_index = 0
        if instance_exists(obj_walknoise)
        {
            with (obj_walknoise)
                instance_destroy()
        }
        global.msg[0] = scr_gettext("obj_darksans1_345")
        global.msg[1] = scr_gettext("obj_darksans1_346")
        global.msg[2] = scr_gettext("obj_darksans1_347")
        instance_create(0, 0, obj_dialoguer)
    }
}

if (conversation == 1 && instance_exists(OBJ_WRITER) == false)
{
    alarm[9] = 40
    conversation = 2
    caster_free(all)
    snd_play(snd_break2)
}

if (conversation == 2)
    global.interact = 1
if (conversation == 3 && instance_exists(OBJ_WRITER) == false)
{
    global.interact = 1
    myinteract = 3
    global.seriousbattle = 1
    global.battlegroup = BattleGroup.Sans
    FL_AreaKillsPointer = KillsPointer_Invalid
    global.mercy = 1
    instance_create(0, 0, obj_battler)
    conversation = 4
}

if (conversation == 4 && !instance_exists(obj_battler))
{
	global.faceemotion = 0
	global.facechoice = 3
	global.typer = 17
	obj_mainchara.visible = true
	sprite_index = spr_sans_r
	image_index = 0
	obj_mainchara.facing = Direction.Left
	global.facing = Direction.Left

	global.interact = 1

	x -= 20
    global.msg[0] = "* nah^1, just messing&  with ya./"
    global.msg[1] = "\\W\\E5* i remember you're&  \\Gpacifists\\W./%%"
    instance_create(0, 0, obj_dialoguer)

	conversation = 6
}

if (conversation == 6 && instance_exists(OBJ_WRITER) && OBJ_WRITER.stringno == 1)
{
	if (sprite_index != spr_sans_r_thumbsup)
	{
		sprite_index = spr_sans_r_thumbsup
		snd_play(snd_whip_hard)
	    rshot = caster_load("music/rimshot.ogg")
	    global.currentsong = caster_load("music/muscle.ogg")
	    global.currentsong2 = caster_load("music/papyrus.ogg")
	}
}

/*if (conversation == 1 && instance_exists(OBJ_WRITER) == false)
{
    global.interact = 1
    obj_mainchara.sprite_index = spr_maincharad
    obj_mainchara.facing = Direction.Down
    global.facing = Direction.Down
    alarm[2] = 50
    conversation = 2
}
if (sprite_index == spr_sans_r_darkhand && conversation == 4 && image_index == 2)
{
    caster_play(fsound, 1, 1)
    alarm[4] = 180
    image_speed = 0
    conversation = 5
}*/
if (conversation == 6 && instance_exists(OBJ_WRITER) == false)
{
	sprite_index = spr_sans_r
	global.interact = 1
    obj_mainchara.visible = false
    mainact = instance_create(obj_mainchara.x, obj_mainchara.y, obj_mainchara_actor)
    mainact.hspeed = 4
    obj_mainchara.hspeed = 4
    hspeed = 4
    image_speed = 0.25
    conversation = 7
}
if (conversation == 7 && x >= 2440)
{
    hspeed = 0
    image_index = 0
    image_speed = 0
    obj_mainchara_actor.hspeed = 0
    obj_mainchara_actor.image_speed = 0
    obj_mainchara_actor.image_index = 0
    obj_mainchara.hspeed = 0
    global.msg[0] = scr_gettext("obj_darksans1_399")
    instance_create(0, 0, obj_dialoguer)
    conversation = 8
    if (murder == 1)
        conversation = 50
}
if (conversation == 8 && instance_exists(OBJ_WRITER) == false)
{
    obj_mainchara_actor.vspeed = -1
    obj_mainchara.vspeed = -1
    conversation = 9
}
if (conversation == 9)
{
    if (obj_mainchara.y <= obj_convenientlamp.y)
    {
        obj_mainchara_actor.vspeed = 0
        obj_mainchara.vspeed = 0
        obj_mainchara.y = obj_convenientlamp.y
        obj_mainchara_actor.y = obj_convenientlamp.y
        obj_mainchara.hspeed = 1
        obj_mainchara_actor.hspeed = 1
		obj_mainchara.y += 60
        hh = instance_create(0, 0, obj_musfadeout)
        hh.fadespeed = 0.01
        conversation = 10
    }
}
if (conversation == 10)
{
    if (obj_mainchara.x >= obj_convenientlamp.x)
    {
        obj_mainchara.hspeed = 0
        obj_mainchara_actor.hspeed = 0
        obj_mainchara_actor.image_speed = 0
        obj_mainchara_actor.image_index = 0
        obj_mainchara.x = obj_convenientlamp.x
        obj_mainchara_actor.x = obj_convenientlamp.x
        pap = instance_create(room_width, (y - 12), obj_papyrus_actor_mad)
        pap.sprite_index = spr_papyrus_l_mad
        pap.direction = 180
        pap.speed = 4
        conversation = 11
    }
}
if (conversation == 11)
{
    if (obj_papyrus_actor_mad.x <= (obj_papyrus_actor_mad.xstart - 140))
    {
        global.currentsong = caster_load("music/papyrus.ogg")
        caster_loop(global.currentsong, 0.5, 1)
        obj_papyrus_actor_mad.speed = 0
        obj_papyrus_actor_mad.image_speed = 0
        obj_papyrus_actor_mad.sprite_index = spr_papyrus_lt_mad
        global.msg[0] = scr_gettext("obj_darksans1_457")
        scr_papface(1, 1)
        global.msg[2] = scr_gettext("obj_darksans1_459")
        instance_create(0, 0, obj_dialoguer)
        conversation = 12
    }
}
if (conversation == 12 && instance_exists(OBJ_WRITER) == false)
{
	if (obj_papyrus_actor_mad.y > obj_mainchara_actor.y - 10)
	{
		obj_papyrus_actor_mad.y -= 10
		obj_papyrus_actor_mad.sprite_index = spr_papyrus_u
		obj_papyrus_actor_mad.image_speed = 1
	}
	else
	{
		obj_papyrus_actor_mad.y = obj_mainchara_actor.y - 10
		if (obj_papyrus_actor_mad.x > obj_mainchara_actor.x)
		{
			obj_papyrus_actor_mad.x -= 10
			obj_papyrus_actor_mad.sprite_index = spr_papyrus_l_mad
			obj_papyrus_actor_mad.image_speed = 1
		}
		else
		{
			obj_papyrus_actor_mad.x = obj_mainchara_actor.x
			obj_papyrus_actor_mad.image_speed = 0
			snd_play(snd_impact);
			conversation = 13
		}
	}
}
if (conversation == 13 && instance_exists(OBJ_WRITER) == false)
{
    obj_papyrus_actor_mad.fun = true
    obj_papyrus_actor_mad.sprite_index = spr_papyrus_mad2
    obj_papyrus_actor_mad.image_speed = 0.25
    conversation = 13.5

	explosion = scr_marker(obj_mainchara_actor.x - 20, obj_mainchara_actor.y - 20, spr_realisticexplosion)
	explosion.image_speed = 1
	alarm[9] = 15
}

if (conversation == 14.5)
{
	instance_destroy(explosion)
	instance_destroy(obj_convenientlamp)
	conversation = 15.5
	alarm[9] = 10
}

if (conversation == 16.5)
{
	snd_play(snd_grab)
	obj_papyrus_actor_mad.y += 2
	obj_mainchara_actor.visible = false
	obj_mainchara.visible = false
	obj_papyrus_actor_mad.fun = true
	obj_papyrus_actor_mad.sprite_index = spr_papyrus_grab
	obj_papyrus_actor_mad.image_speed = 0
	conversation = 17.5
	alarm[9] = 20
}

if (conversation == 18.5)
{
    conversation = 19.5
    global.faceemotion = 1
    global.facechoice = 4
    global.typer = 18
    global.msg[0] = "SEE YOU IN HELL^1,&BITCH./"
	global.msg[1] = "NYEHEHEHEHEHEHEHE&HEHEHEHEHE!!!/%%"
	instance_create(0, 0, obj_dialoguer)
}

if (conversation == 19.5 && instance_exists(OBJ_WRITER) == false)
{
	snd_play(snd_spearrise)
	obj_papyrus_actor_mad.sprite_index = spr_papyrus_throw
	obj_papyrus_actor_mad.x += 16
	obj_papyrus_actor_mad.y -= 4
	obj_mainchara_actor.visible = true
	obj_mainchara_actor.fun = true
	obj_mainchara_actor.sprite_index = spr_maincharad_c
	spinactor = true
	obj_mainchara_actor.vspeed = -10
	conversation = 20.5
	alarm[9] = 20
}

var xx = view_xview_get(view_current)
var yy = view_yview_get(view_current)

if (conversation == 21.5)
{
	lines = true
	conversation = 22.5
	alarm[9] = 45
	cover = scr_marker(xx, yy, spr_pixwht)
	cover.image_xscale = 320
	cover.image_yscale = 240
	cover.image_blend = make_color_rgb(0, 0, 10)
	caster_set_volume(global.currentsong, 0.1)

	repeat(8)
	{
		marker = scr_marker(random_range(xx + 0, xx + 160 - 64), random_range(yy - 240, 0), spr_pixwht)
		marker.vspeed = 40
		marker.image_yscale = 40
		marker.depth = cover.depth - 1
	}

	repeat(8)
	{
		marker = scr_marker(random_range(xx + 160 + 64, xx + 320), random_range(yy - 240, 0), spr_pixwht)
		marker.vspeed = 40
		marker.image_yscale = 40
		marker.depth = cover.depth - 1
	}

	obj_mainchara_actor.vspeed = 0
	obj_mainchara_actor.y = 120
	obj_mainchara_actor.d = 1
	obj_mainchara_actor.depth = cover.depth - 1
}

if (conversation == 23.5)
{
	caster_stop(global.currentsong)

	conversation = 24.5
	with (obj_npc_marker)
	{
		if (sprite_index == spr_pixwht)
		{
			instance_destroy()
		}
	}

	cover = scr_marker(xx, yy, spr_pixwht)
	cover.image_xscale = 320
	cover.image_yscale = 240
	cover.image_blend = make_color_rgb(0, 0, 0)

	obj_mainchara_actor.visible = false

	slide = scr_marker(xx, yy, spr_introimage)
	slide.depth = cover.depth - 1
	slide.image_index = 5
	alarm[9] = 90

	mus = caster_play(mus_story_real, 1, 0.91)
	audio_sound_set_track_position(mus, 26.66)
}

if (conversation == 25.5)
{
	if (slide.sprite_index == spr_introimage_funny)
	{
		slide.image_alpha += 0.05

		if (slide.image_alpha >= 1)
		{
			conversation = 26.5
		}

	}
	else
	{
		slide.image_alpha -= 0.05

		if (slide.image_alpha <= 0)
		{
			slide.image_index = 0
			slide.sprite_index = spr_introimage_funny
		}

	}

	slide.image_alpha = clamp(slide.image_alpha, 0, 1)
}

if (lines)
{
	with (obj_npc_marker)
	{
		if (y > yy + 240) y = yy - 64
	}
}

if (spinactor)
{
	with (obj_mainchara_actor)
	{
		image_angle += 45
	}
}

if (conversation == 14 && instance_exists(OBJ_WRITER) == false)
{
    obj_papyrus_actor_mad.fun = false
    obj_papyrus_actor_mad.sprite_index = spr_papyrus_lt
    obj_papyrus_actor_mad.image_speed = 0
    conversation = 15
    global.faceemotion = 0
    global.facechoice = 3
    global.typer = 17
    global.msg[0] = scr_gettext("obj_darksans1_514")
    global.msg[1] = scr_gettext("obj_darksans1_515")
    instance_create(0, 0, obj_dialoguer)
}
if (conversation == 15 && instance_exists(OBJ_WRITER) == false)
{
    obj_papyrus_actor_mad.fun = true
    obj_papyrus_actor_mad.sprite_index = spr_papyrus_mad2
    obj_papyrus_actor_mad.image_speed = 0.4
    conversation = 16
    global.faceemotion = 1
    global.facechoice = 4
    global.typer = 18
    global.msg[0] = scr_gettext("obj_darksans1_528")
    global.msg[1] = scr_gettext("obj_darksans1_529")
    global.msg[2] = scr_gettext("obj_darksans1_530")
    scr_sansface(3, 0)
    global.msg[4] = scr_gettext("obj_darksans1_532")
    global.msg[5] = scr_gettext("obj_darksans1_533")
    instance_create(0, 0, obj_dialoguer)
}
if (conversation == 16 && instance_exists(OBJ_WRITER) == false)
{
    conversation = 18
    alarm[6] = 10
    rememberxview = view_xview_get(view_current)
    rememberyview = view_yview_get(view_current)
    view_target_set(view_current, noone)
    obj_mainchara.cutscene = true
}
if (conversation == 17)
{
}
if (conversation == 18)
{
    if ((x + (sprite_width / 2)) > (view_xview_get(view_current) + (view_wview_get(view_current) / 2)))
        view_xview_set(view_current, (view_xview_get(view_current) + 3))
    if ((y + (sprite_height / 2)) > (view_yview_get(view_current) + (view_hview_get(view_current) / 2)))
        view_yview_set(view_current, (view_yview_get(view_current) + 9))
    view_hview_set(view_current, (view_hview_get(view_current) - 12))
    view_wview_set(view_current, (view_wview_get(view_current) - 16))
    alarm[7] = 30
}
if (conversation == 20)
{
    if (view_xview_get(view_current) > rememberxview)
        view_xview_set(view_current, (view_xview_get(view_current) - 3))
    if (view_yview_get(view_current) > rememberyview)
        view_yview_set(view_current, (view_yview_get(view_current) - 9))
    view_hview_set(view_current, (view_hview_get(view_current) + 12))
    view_wview_set(view_current, (view_wview_get(view_current) + 16))
}
if (conversation == 21)
{
    obj_papyrus_actor_mad.fun = false
    obj_papyrus_actor_mad.sprite_index = spr_papyrus_lt_mad
    conversation = 16
    sprite_index = spr_sans_r
    global.faceemotion = 1
    global.facechoice = 4
    global.typer = 18
    global.msg[0] = scr_gettext("obj_darksans1_582")
    scr_sansface(1, 1)
    global.msg[2] = scr_gettext("obj_darksans1_584")
    scr_papface(3, 4)
    global.msg[4] = scr_gettext("obj_darksans1_586")
    global.msg[5] = scr_gettext("obj_darksans1_587")
    global.msg[6] = scr_gettext("obj_darksans1_588")
    global.msg[7] = scr_gettext("obj_darksans1_589")
    scr_sansface(8, 1)
    global.msg[9] = scr_gettext("obj_darksans1_591")
    global.msg[10] = scr_gettext("obj_darksans1_592")
    instance_create(0, 0, obj_dialoguer)
}
if (conversation == 23)
{
    sprite_index = spr_sans_r
    obj_papyrus_actor_mad.fun = false
    obj_papyrus_actor_mad.sprite_index = spr_papyrus_lt_mad
    global.faceemotion = 1
    global.facechoice = 4
    global.typer = 18
    global.msg[0] = scr_gettext("obj_darksans1_604")
    global.msg[1] = scr_gettext("obj_darksans1_605")
    global.msg[2] = scr_gettext("obj_darksans1_606")
    global.msg[3] = scr_gettext("obj_darksans1_607")
    global.msg[4] = scr_gettext("obj_darksans1_608")
    global.msg[5] = scr_gettext("obj_darksans1_609")
    conversation = 24
    instance_create(0, 0, obj_dialoguer)
}
if (conversation == 24 && instance_exists(OBJ_WRITER) == false)
{
    obj_papyrus_actor_mad.image_speed = 0.5
    obj_papyrus_actor_mad.sprite_index = obj_papyrus_actor_mad.rsprite
    obj_papyrus_actor_mad.hspeed = 4
    conversation = 25
}
if (conversation == 25)
{
    if (obj_papyrus_actor_mad.x > (obj_papyrus_actor_mad.xstart + 5))
    {
        obj_papyrus_actor_mad.sprite_index = spr_papyrus_l
        obj_papyrus_actor_mad.hspeed = -1
        obj_papyrus_actor_mad.image_speed = 0
        conversation = 26
    }
}
if (conversation == 26)
{
    if (obj_papyrus_actor_mad.x < (obj_papyrus_actor_mad.xstart - 50))
    {
        obj_papyrus_actor_mad.hspeed = 0
        obj_papyrus_actor_mad.sprite_index = spr_papyrus_lt
        obj_papyrus_actor_mad.image_index = 0
        global.faceemotion = 2
        global.facechoice = 4
        global.typer = 18
        global.msg[0] = scr_gettext("obj_darksans1_644")
        instance_create(0, 0, obj_dialoguer)
        conversation = 27
    }
}
if (conversation == 27 && instance_exists(OBJ_WRITER) == false)
{
    obj_papyrus_actor_mad.hspeed = 1
    obj_papyrus_actor_mad.sprite_index = spr_papyrus_r
    conversation = 28
    hh = instance_create(0, 0, obj_musfadeout)
    hh.fadespeed = 0.01
}
if (conversation == 28)
{
    if (obj_papyrus_actor_mad.x > obj_papyrus_actor_mad.xstart)
    {
        global.faceemotion = 0
        global.facechoice = 3
        global.typer = 17
        global.msg[0] = scr_gettext("obj_darksans1_666")
        view_target_set(view_current, obj_mainchara)
        obj_mainchara.cutscene = false
        instance_create(0, 0, obj_dialoguer)
        conversation = 29
    }
}
if (conversation == 29 && instance_exists(OBJ_WRITER) == false)
{
    obj_mainchara.y -= 60
    rememberx = obj_mainchara.x
    obj_mainchara.hspeed = -2
    obj_mainchara_actor.hspeed = -2
    conversation = 30
}
if (conversation == 30 && instance_exists(obj_mainchara))
{
    if (obj_mainchara.x < (rememberx - 30))
    {
        obj_mainchara.facing = Direction.Down
        global.facing = Direction.Down
        obj_mainchara.hspeed = 0
        with (obj_mainchara_actor)
            instance_destroy()
        obj_mainchara.visible = true
        global.plot = 36
        global.interact = 0
        instance_create(80, 160, obj_stalkerflowey)
        instance_create(x, y, obj_sans_interactable1)
        instance_create(2380, 0, obj_sansbyetrigger)
        instance_create(2680, 0, obj_sansbyetrigger)
        conversation = 32
        trophy_unlock("tundra")
        instance_destroy()
    }
}
if (conversation == 50 && instance_exists(OBJ_WRITER) == false)
{
    hh = instance_create(0, 0, obj_musfadeout)
    hh.fadespeed = 0.01
    global.interact = 1
    conversation = 51
    alarm[9] = 90
}
if (conversation == 52)
{
    sprite_index = spr_sans_r
    global.faceemotion = 0
    global.facechoice = 3
    global.typer = 17
    global.msc = 0
    global.msg[0] = scr_gettext("obj_darksans1_720")
    global.msg[1] = scr_gettext("obj_darksans1_721")
    instance_create(0, 0, obj_dialoguer)
    conversation = 53
}
if (conversation == 53 && instance_exists(OBJ_WRITER) == false)
{
    sprite_index = spr_sans_r
    pap = instance_create(room_width, (y - 12), obj_papyrus_actor_mad)
    pap.sprite_index = spr_papyrus_l_mad
    pap.direction = 180
    pap.speed = 4
    conversation = 54
}
if (conversation == 54)
{
    if (obj_papyrus_actor_mad.x <= (obj_papyrus_actor_mad.xstart - 180))
    {
        global.currentsong = global.currentsong2
        caster_loop(global.currentsong, 0.5, 1)
        obj_papyrus_actor_mad.speed = 0
        obj_papyrus_actor_mad.image_speed = 0
        obj_papyrus_actor_mad.sprite_index = spr_papyrus_lt_mad
        global.facechoice = 0
        global.faceemotion = 0
        global.typer = 5
        global.msc = 0
        scr_papface(0, 1)
        global.msg[1] = scr_gettext("obj_darksans1_750")
        scr_sansface(2, 2)
        global.msg[3] = scr_gettext("obj_darksans1_752")
        scr_papface(4, 0)
        global.msg[5] = scr_gettext("obj_darksans1_754")
        global.msg[6] = scr_gettext("obj_darksans1_755")
        instance_create(0, 0, obj_dialoguer)
        conversation = 55
    }
}
if (conversation == 55 && instance_exists(OBJ_WRITER) == false)
{
    obj_papyrus_actor_mad.image_speed = 0.5
    obj_papyrus_actor_mad.sprite_index = spr_papyrus_r
    obj_papyrus_actor_mad.hspeed = 4
    hh = instance_create(0, 0, obj_musfadeout)
    hh.fadespeed = 0.02
    conversation = 56
}
if (conversation == 56)
{
    if (obj_papyrus_actor_mad.x > obj_papyrus_actor_mad.xstart)
    {
        global.faceemotion = 0
        global.facechoice = 3
        global.typer = 17
        global.msg[0] = scr_gettext("obj_darksans1_780")
        view_target_set(view_current, obj_mainchara)
        obj_mainchara.cutscene = false
        instance_create(0, 0, obj_dialoguer)
        conversation = 58
    }
}
if (conversation == 58 && instance_exists(OBJ_WRITER) == false)
{
    obj_mainchara.facing = Direction.Down
    global.facing = Direction.Down
    obj_mainchara.hspeed = 0
    with (obj_mainchara_actor)
        instance_destroy()
    obj_mainchara.visible = true
    global.plot = 36
    global.interact = 0
    instance_create(80, 160, obj_stalkerflowey)
    instance_create(x, y, obj_sans_interactable1)
    instance_create(2380, 0, obj_sansbyetrigger)
    instance_create(2680, 0, obj_sansbyetrigger)
    conversation = 59
    trophy_unlock("tundra")
    instance_destroy()
}
