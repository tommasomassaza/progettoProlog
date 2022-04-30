cerca_soluzione(ListaAzioni):-
    iniziale(SIniziale),
    euristicaFuoriPosto(SIniziale,Soglia),
    iterative(SIniziale,ListaAzioni,Soglia).

iterative(SIniziale,ListaAzioni,Soglia):-
    ida(SIniziale,ListaAzioni,Soglia,[],0).
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
    euristicaFuoriPosto(SNuovo,H),
    NuovoCosto is Costo + 1,
    F is H + NuovoCosto,
    asserta(soglia(F)),
    F =< Soglia,
    ida(SNuovo,ListaAzioni,Soglia,[S|Visitati],NuovoCosto).

