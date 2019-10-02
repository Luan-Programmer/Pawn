#if !defined gpci
    native gpci(playerid, value[], len);
#endif

stock BotSpawnerCheck(playerid)
{
    if(IsPlayerNPC(playerid))
        return 0;

    new p_gpci[80], p_numb;

    gpci(playerid, p_gpci, sizeof p_gpci);

    new i = strlen(p_gpci);

    while (i--)
    {
        if(p_gpci[i] >= '0' && p_gpci[i] <= '9') p_numb++;
    }

    return (p_numb >= 30 || strlen(p_gpci) <= 30) ? true : false;
}


public OnPlayerConnect(playerid)
{
    if (BotSpawnerCheck(playerid))
    {
        // enviar mensagem para os admins
    }
    return 1;
} 
