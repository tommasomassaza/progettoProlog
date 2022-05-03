% Applicabile(AZ,S)
applicabile(down,[_,_,_,_,_,_,_,_,_,_,_,_,M,N,O,P]):-
    M=\=0,N=\=0,O=\=0,P=\=0.
applicabile(up,[A,B,C,D,_,_,_,_,_,_,_,_,_,_,_,_]):-
    A=\=0,B=\=0,C=\=0,D=\=0.
applicabile(left,[A,_,_,_,E,_,_,_,I,_,_,_,M,_,_,_]):-
    A=\=0,E=\=0,I=\=0,M=\=0.
applicabile(right,[_,_,_,D,_,_,_,H,_,_,_,L,_,_,_,P]):-
    D=\=0,H=\=0,L=\=0,P=\=0.



% trasforma(AZ,S,S_Nuovo)
/*
trasforma(down,S,S_Nuovo):-
    posizione(S,0,VecchiaPosizione),
    NuovaPosizione is VecchiaPosizione + 4,
    elemento(S,Elemento,NuovaPosizione),
    inserisci(0,NuovaPosizione,S,S_),
    inserisci(Elemento,VecchiaPosizione,S_,S_Nuovo).
trasforma(up,S,S_Nuovo):-
    posizione(S,0,VecchiaPosizione),
    NuovaPosizione is VecchiaPosizione - 4,
    elemento(S,Elemento,NuovaPosizione),
    inserisci(0,NuovaPosizione,S,S_),
    inserisci(Elemento,VecchiaPosizione,S_,S_Nuovo).
trasforma(left,S,S_Nuovo):-
    posizione(S,0,VecchiaPosizione),
    NuovaPosizione is VecchiaPosizione - 1,
    elemento(S,Elemento,NuovaPosizione),
    inserisci(0,NuovaPosizione,S,S_),
    inserisci(Elemento,VecchiaPosizione,S_,S_Nuovo).
trasforma(right,S,S_Nuovo):-
    posizione(S,0,VecchiaPosizione),
    NuovaPosizione is VecchiaPosizione + 1,
    elemento(S,Elemento,NuovaPosizione),
    inserisci(0,NuovaPosizione,S,S_),
    inserisci(Elemento,VecchiaPosizione,S_,S_Nuovo).
*/

trasforma(up,S,S_Nuovo):-
    moveUp(S,S_Nuovo),
    !.
trasforma(down,S,S_Nuovo):-
    moveDown(S,S_Nuovo),
    !.
trasforma(left,S,S_Nuovo):-
    moveLeft(S,S_Nuovo),
    !.
trasforma(right,S,S_Nuovo):-
    moveRight(S,S_Nuovo),
    !.


moveUp([A,B,C,D,0,F,G,H,I,J,K,L,M,N,O,P],[0,B,C,D,A,F,G,H,I,J,K,L,M,N,O,P]).
moveUp([A,B,C,D,E,0,G,H,I,J,K,L,M,N,O,P],[A,0,C,D,E,B,G,H,I,J,K,L,M,N,O,P]).
moveUp([A,B,C,D,E,F,0,H,I,J,K,L,M,N,O,P],[A,B,0,D,E,F,C,H,I,J,K,L,M,N,O,P]).
moveUp([A,B,C,D,E,F,G,0,I,J,K,L,M,N,O,P],[A,B,C,0,E,F,G,D,I,J,K,L,M,N,O,P]).
moveUp([A,B,C,D,E,F,G,H,0,J,K,L,M,N,O,P],[A,B,C,D,0,F,G,H,E,J,K,L,M,N,O,P]).
moveUp([A,B,C,D,E,F,G,H,I,0,K,L,M,N,O,P],[A,B,C,D,E,0,G,H,I,F,K,L,M,N,O,P]).
moveUp([A,B,C,D,E,F,G,H,I,J,0,L,M,N,O,P],[A,B,C,D,E,F,0,H,I,J,G,L,M,N,O,P]).
moveUp([A,B,C,D,E,F,G,H,I,J,K,0,M,N,O,P],[A,B,C,D,E,F,G,0,I,J,K,H,M,N,O,P]).
moveUp([A,B,C,D,E,F,G,H,I,J,K,L,0,N,O,P],[A,B,C,D,E,F,G,H,0,J,K,L,I,N,O,P]).
moveUp([A,B,C,D,E,F,G,H,I,J,K,L,M,0,O,P],[A,B,C,D,E,F,G,H,I,0,K,L,M,J,O,P]).
moveUp([A,B,C,D,E,F,G,H,I,J,K,L,M,N,0,P],[A,B,C,D,E,F,G,H,I,J,0,L,M,N,K,P]).
moveUp([A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,0],[A,B,C,D,E,F,G,H,I,J,K,0,M,N,O,L]).

moveDown([0,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],[E,B,C,D,0,F,G,H,I,J,K,L,M,N,O,P]).
moveDown([A,0,C,D,E,F,G,H,I,J,K,L,M,N,O,P],[A,F,C,D,E,0,G,H,I,J,K,L,M,N,O,P]).
moveDown([A,B,0,D,E,F,G,H,I,J,K,L,M,N,O,P],[A,B,G,D,E,F,0,H,I,J,K,L,M,N,O,P]).
moveDown([A,B,C,0,E,F,G,H,I,J,K,L,M,N,O,P],[A,B,C,H,E,F,G,0,I,J,K,L,M,N,O,P]).
moveDown([A,B,C,D,0,F,G,H,I,J,K,L,M,N,O,P],[A,B,C,D,I,F,G,H,0,J,K,L,M,N,O,P]).
moveDown([A,B,C,D,E,0,G,H,I,J,K,L,M,N,O,P],[A,B,C,D,E,J,G,H,I,0,K,L,M,N,O,P]).
moveDown([A,B,C,D,E,F,0,H,I,J,K,L,M,N,O,P],[A,B,C,D,E,F,K,H,I,J,0,L,M,N,O,P]).
moveDown([A,B,C,D,E,F,G,0,I,J,K,L,M,N,O,P],[A,B,C,D,E,F,G,L,I,J,K,0,M,N,O,P]).
moveDown([A,B,C,D,E,F,G,H,0,J,K,L,M,N,O,P],[A,B,C,D,E,F,G,H,M,J,K,L,0,N,O,P]).
moveDown([A,B,C,D,E,F,G,H,I,0,K,L,M,N,O,P],[A,B,C,D,E,F,G,H,I,N,K,L,M,0,O,P]).
moveDown([A,B,C,D,E,F,G,H,I,J,0,L,M,N,O,P],[A,B,C,D,E,F,G,H,I,J,O,L,M,N,0,P]).
moveDown([A,B,C,D,E,F,G,H,I,J,K,0,M,N,O,P],[A,B,C,D,E,F,G,H,I,J,K,P,M,N,O,0]).

moveRight([0,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],[B,0,C,D,E,F,G,H,I,J,K,L,M,N,O,P]).
moveRight([A,0,C,D,E,F,G,H,I,J,K,L,M,N,O,P],[A,C,0,D,E,F,G,H,I,J,K,L,M,N,O,P]).
moveRight([A,B,0,D,E,F,G,H,I,J,K,L,M,N,O,P],[A,B,D,0,E,F,G,H,I,J,K,L,M,N,O,P]).
moveRight([A,B,C,D,0,F,G,H,I,J,K,L,M,N,O,P],[A,B,C,D,F,0,G,H,I,J,K,L,M,N,O,P]).
moveRight([A,B,C,D,E,0,G,H,I,J,K,L,M,N,O,P],[A,B,C,D,E,G,0,H,I,J,K,L,M,N,O,P]).
moveRight([A,B,C,D,E,F,0,H,I,J,K,L,M,N,O,P],[A,B,C,D,E,F,H,0,I,J,K,L,M,N,O,P]).
moveRight([A,B,C,D,E,F,G,H,0,J,K,L,M,N,O,P],[A,B,C,D,E,F,G,H,J,0,K,L,M,N,O,P]).
moveRight([A,B,C,D,E,F,G,H,I,0,K,L,M,N,O,P],[A,B,C,D,E,F,G,H,I,K,0,L,M,N,O,P]).
moveRight([A,B,C,D,E,F,G,H,I,J,0,L,M,N,O,P],[A,B,C,D,E,F,G,H,I,J,L,0,M,N,O,P]).
moveRight([A,B,C,D,E,F,G,H,I,J,K,L,0,N,O,P],[A,B,C,D,E,F,G,H,I,J,K,L,N,0,O,P]).
moveRight([A,B,C,D,E,F,G,H,I,J,K,L,M,0,O,P],[A,B,C,D,E,F,G,H,I,J,K,L,M,O,0,P]).
moveRight([A,B,C,D,E,F,G,H,I,J,K,L,M,N,0,P],[A,B,C,D,E,F,G,H,I,J,K,L,M,N,P,0]).

moveLeft([A,0,C,D,E,F,G,H,I,J,K,L,M,N,O,P],[0,A,C,D,E,F,G,H,I,J,K,L,M,N,O,P]).
moveLeft([A,B,0,D,E,F,G,H,I,J,K,L,M,N,O,P],[A,0,B,D,E,F,G,H,I,J,K,L,M,N,O,P]).
moveLeft([A,B,C,0,E,F,G,H,I,J,K,L,M,N,O,P],[A,B,0,C,E,F,G,H,I,J,K,L,M,N,O,P]).
moveLeft([A,B,C,D,E,0,G,H,I,J,K,L,M,N,O,P],[A,B,C,D,0,E,G,H,I,J,K,L,M,N,O,P]).
moveLeft([A,B,C,D,E,F,0,H,I,J,K,L,M,N,O,P],[A,B,C,D,E,0,F,H,I,J,K,L,M,N,O,P]).
moveLeft([A,B,C,D,E,F,G,0,I,J,K,L,M,N,O,P],[A,B,C,D,E,F,0,G,I,J,K,L,M,N,O,P]).
moveLeft([A,B,C,D,E,F,G,H,I,0,K,L,M,N,O,P],[A,B,C,D,E,F,G,H,0,I,K,L,M,N,O,P]).
moveLeft([A,B,C,D,E,F,G,H,I,J,0,L,M,N,O,P],[A,B,C,D,E,F,G,H,I,0,J,L,M,N,O,P]).
moveLeft([A,B,C,D,E,F,G,H,I,J,K,0,M,N,O,P],[A,B,C,D,E,F,G,H,I,J,0,K,M,N,O,P]).
moveLeft([A,B,C,D,E,F,G,H,I,J,K,L,M,0,O,P],[A,B,C,D,E,F,G,H,I,J,K,L,0,M,O,P]).
moveLeft([A,B,C,D,E,F,G,H,I,J,K,L,M,N,0,P],[A,B,C,D,E,F,G,H,I,J,K,L,M,0,N,P]).