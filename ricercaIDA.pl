cerca_soluzioneIDA(ListaAzioni):-
    iniziale(SIniziale),
    %euristicaFuoriPosto(SIniziale,Soglia),
    euristicaManhattan(SIniziale, Soglia),
    iterative(SIniziale,ListaAzioni,Soglia).

iterative(SIniziale,ListaAzioni,Soglia):-
    write("Soglia"),write("  "),write(Soglia),write("\n"),
    idaStar(SIniziale,ListaAzioni,Soglia,[],0),    
    retractall(soglia(_)),
    !.
iterative(SIniziale,ListaAzioni,Soglia):-
    findall(F,soglia(F),ListaSoglie),
    escludo(Soglia,ListaSoglie,ListaSoglieNuove),
    sort(ListaSoglieNuove,[NuovaSoglia|_]),
    retractall(soglia(_)),
    iterative(SIniziale,ListaAzioni,NuovaSoglia).    

idaStar(S,[],_,_,_):-
    finale(S),
    !.
idaStar(S,[Az|ListaAzioni],Soglia,Visitati,Costo):-
    applicabile(Az,S),
    trasforma(Az,S,SNuovo),
    \+member(SNuovo,Visitati),
    %euristicaFuoriPosto(SNuovo,H),
    euristicaManhattan(SNuovo, H),
    NuovoCosto is Costo + 1,
    F is H + NuovoCosto,
    asserta(soglia(F)),
    F =< Soglia,
    idaStar(SNuovo,ListaAzioni,Soglia,[SNuovo|Visitati],NuovoCosto).

