posizione(Lista,Elemento,Posizione):-
    cercaPosizione(Lista,Elemento,Posizione,1).
cercaPosizione([Elemento|_],Elemento,X,X):-
    !.
cercaPosizione([_|Tail],Elemento,Posizione,Indice):-
    NuovoIndice is Indice + 1,
    cercaPosizione(Tail,Elemento,Posizione,NuovoIndice).


elemento(Lista,Elemento,Posizione):-
    cercaElemento(Lista,Elemento,Posizione,1).
cercaElemento([Elemento|_],Elemento,X,X):-
    !.
cercaElemento([_|Tail],Elemento,Posizione,Indice):-
    NuovoIndice is Indice + 1,
    cercaElemento(Tail,Elemento,Posizione,NuovoIndice).


inserisci(Elemento,Posizione,S,S_Nuovo):-
    inserisci_(Elemento,Posizione,S,S_Nuovo,1).
inserisci_(Elemento,X,[_|Tail],[Elemento|Tail],X):-
    !.
inserisci_(Elemento,Posizione,[HeadS|TailS],[HeadS|TailS_Nuovo],Indice):-
    NuovoIndice is Indice + 1,
    inserisci_(Elemento,Posizione,TailS,TailS_Nuovo,NuovoIndice).


escludo(_,[],[]):-
    !.
escludo(Soglia, [Head|Tail], [NHead|NTail]):-
    Head > Soglia,
    !,
    NHead is Head,
    escludo(Soglia, Tail, NTail).
escludo(Soglia, [_|Tail], NTail):-
    escludo(Soglia, Tail, NTail).



primoElemento([Head|_],PrimoElemento):-
    PrimoElemento is Head.


