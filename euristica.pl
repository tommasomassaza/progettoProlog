% euristica che ci dice quante tessere sono fuori posto rispetto allo stato finale
euristicaFuoriPosto(Stato, Costo) :-
    finale(SFinale),
    conta(Stato, SFinale, Costo).

conta([],[],0).
conta([Head|Tail], [HeadG|TailG], NuovoCosto):-
    Head =\= HeadG,
    !,
    conta(Tail,TailG,Costo),
    NuovoCosto is Costo + 1.
conta([_|Tail], [_|TailG], Costo):-
    conta(Tail,TailG,Costo).
