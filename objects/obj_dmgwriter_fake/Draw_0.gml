thisnum = dmg
if (thisnum >= 0)
{
    place = 0
    numadd = 10
    if (thisnum >= numadd)
    {
        while (thisnum >= numadd)
        {
            place += 1
            numadd *= 10
        }
    }
}
else
{
    thisnum = 0
    place = 0
}
thisnum2 = thisnum
for (i = place; i >= 0; i -= 1)
{
    numnum[i] = floor((thisnum2 / power(10, i)))
    thisnum2 -= (numnum[i] * power(10, i))
}
if (thisnum > 0)
{
    for (i = place; i >= 0; i -= 1)
    {
        draw_set_color(c_red)
        draw_sprite_ext(spr_dmgnum_o, numnum[i], (((x + 30) - (i * 32)) + (place * 16)), (y - 28), 1, 1, 0, c_red, 1)
    }
}
if (y > ystart)
{
    y = ystart
    vspeed = 0
    gravity = 0
}
