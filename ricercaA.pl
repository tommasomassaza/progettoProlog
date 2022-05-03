cerca_soluzioneA(ListaAzioni):-
    iniziale(SIniziale),
    %euristicaFuoriPosto(SIniziale,H),
    euristicaManhattan(SIniziale, H),
    write(H),write('\n'),
    aStar(ListaAzioni,[H,SIniziale,[],0],[],[],H),
    !.

aStar(ListaAzioni,[_,S,ListaAzioni,_],_,_,_):-
    finale(S),
    !.
/*aStar(ListaAzioni,[F,S,PercorsoPerS,Costo],Successori,NodiEspansi,MinEur):-
    H is F - Costo,
    H < MinEur,
    write(H),write('\n'),
    aStar(ListaAzioni,[F,S,PercorsoPerS,Costo],Successori,NodiEspansi,H),
    !.*/
aStar(ListaAzioni,[_,S,PercorsoPerS,Costo],Successori,NodiEspansi,MinEur):-
    findall(Az,applicabile(Az,S),AzioniApplicabili),
    NuovoCosto is Costo + 1,
    espansione(S,AzioniApplicabili,PercorsoPerS,NuovoCosto,NodiFigli,NodiEspansi),
    append(Successori,NodiFigli,NuoviSuccessori),
    msort(NuoviSuccessori,[NodoDaEspandere|NuoviSuccessoriOrdinati]), % ordina in maniera crescente in base a F
    deletePers(NuoviSuccessoriOrdinati,NodoDaEspandere,NuoviSuccessoriOrdinati_), % rimuove tutti i nodi con lo stesso stato del primo nella lista che verrà espanso
    aStar(ListaAzioni,NodoDaEspandere,NuoviSuccessoriOrdinati_,[S|NodiEspansi],MinEur).

espansione(_,[],_,_,[],_).
espansione(S,[Az|AzioniRestanti],PercorsoPerS,Costo,[[F,S_Nuovo,PercorsoPerS_Nuovo,Costo]|NodiFigli],NodiEspansi):-
    trasforma(Az,S,S_Nuovo),
    \+member(S_Nuovo, NodiEspansi), % se è già espanso -> fail
    %euristicaFuoriPosto(S_Nuovo, Soglia),
    euristicaManhattan(S_Nuovo, H),
    F is Costo + H,
    append(PercorsoPerS,[Az],PercorsoPerS_Nuovo),
    espansione(S,AzioniRestanti,PercorsoPerS,Costo,NodiFigli,NodiEspansi).
espansione(S,[_|AzioniRestanti],PercorsoPerS,Costo,NodiFigli,NodiEspansi):-
    espansione(S,AzioniRestanti,PercorsoPerS,Costo,NodiFigli,NodiEspansi).

