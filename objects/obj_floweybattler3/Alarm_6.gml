blcon = instance_create((x + 100), y, obj_blconwdflowey)
gg = floor(random(3))
mycommand = round(random(100))
if (global.hp < global.maxhp)
{
    if (mycommand >= 0 && mycommand < 50)
        global.msg[0] = scr_gettext("obj_vulkin_271")
    if (mycommand >= 50)
        global.msg[0] = scr_gettext("obj_vulkin_272")
}
if (global.hp >= global.maxhp)
{
    global.msg[0] = "Come on^1, that wasn't&even close."
}
if (criticize > 0)
{
    if (mycommand >= 0 && mycommand < 50)
        global.msg[0] = scr_gettext("obj_vulkin_283")
    if (mycommand >= 50)
        global.msg[0] = scr_gettext("obj_vulkin_284")
}
if (hug > 0)
{
    if (mycommand >= 0 && mycommand < 50)
        global.msg[0] = scr_gettext("obj_vulkin_291")
    if (mycommand >= 50)
        global.msg[0] = scr_gettext("obj_vulkin_292")
}
if (encourage > 0)
{
    if (mycommand >= 0 && mycommand < 50)
        global.msg[0] = scr_gettext("obj_vulkin_298")
    if (mycommand >= 50)
        global.msg[0] = scr_gettext("obj_vulkin_299")
}
if (whatiheard == 1)
{
    global.msg[0] = "Not this time!"
}
if (whatiheard == 3)
{
	global.msg[0] = "Whoops^1!&Nobody came!"
}

global.msg[1] = "%%%"

global.typer = 6

blconwd = instance_create((obj_blconwdflowey.x + 40), (obj_blconwdflowey.y + 10), OBJ_NOMSCWRITER)
global.border = 17
obj_heart.x = (round(((global.idealborder[0] + global.idealborder[1]) / 2)) - 8)
obj_heart.y = (round(((global.idealborder[2] + global.idealborder[3]) / 2)) - 8)
