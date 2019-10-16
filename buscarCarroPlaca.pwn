#include <a_samp> 
#include <zcmd> 
#include <sscanf2>

main () {} 

enum DadosVeiculo 
{ 
    idVeiculo, 
    Placa[10] 
}; 
new Veiculo[MAX_VEHICLES][DadosVeiculo]; 

public OnGameModeInit() { 
    for(new idV = 1; idV < 10; idV++) { 
        format(Veiculo[idV][Placa], 10, "AAA-%04d", idV); 
        procurarPlaca(Veiculo[idV][Placa]); 
    } 
    return 1; 
} 

stock procurarPlaca(placaV[]) { 
    new string[40]; 
    for(new i = 1; i < MAX_VEHICLES; i++) { 
        if(!strcmp(Veiculo[i][Placa], placaV, false)) { 
            format(string, sizeof(string), "Carro ID: %d - Placa: %s", i, placaV); 
            printf("%s", string); 
            return i; 
        } 
    } 
    return 0; 
} 

//Uso: 
CMD:procurar_placa(playerid, params[]) { 
    new placaVeiculo[10]; 
    if(sscanf(params, "s[10]")) return SendClientMessage(playerid, -1, "Uso correto: /procurar_placa [Placa]."); 
    procurarPlaca(placaVeiculo); 
    return 1; 
}
