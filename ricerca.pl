cerca_soluzione(ListaAzioni):-
    iniziale(SIniziale),
    %euristicaFuoriPosto(SIniziale,Soglia),
    euristicaManhattan(SIniziale, Soglia),
    iterative(SIniziale,ListaAzioni,Soglia).

iterative(SIniziale,ListaAzioni,Soglia):-
    write("Soglia"),write("  "),write(Soglia),write("\n"),
    ida(SIniziale,ListaAzioni,Soglia,[],0),    
    retractall(soglia(_)),
    !.
iterative(SIniziale,ListaAzioni,Soglia):-
    findall(F,soglia(F),ListaSoglie),
    escludo(Soglia,ListaSoglie,ListaSoglieNuove),
    sort(ListaSoglieNuove,ListaSoglieOrdinata),
    retractall(soglia(_)),
    primoElemento(ListaSoglieOrdinata,NuovaSoglia),
    iterative(SIniziale,ListaAzioni,NuovaSoglia).    

ida(S,[],_,_,_):-
    finale(S),
    !.
ida(S,[Az|ListaAzioni],Soglia,Visitati,Costo):-
    applicabile(Az,S),
    trasforma(Az,S,SNuovo),
    \+member(SNuovo,Visitati),
    %euristicaFuoriPosto(SNuovo,H),
    euristicaManhattan(SNuovo, H),
    NuovoCosto is Costo + 1,
    F is H + NuovoCosto,
    asserta(soglia(F)),
    F =< Soglia,
    ida(SNuovo,ListaAzioni,Soglia,[SNuovo|Visitati],NuovoCosto).

