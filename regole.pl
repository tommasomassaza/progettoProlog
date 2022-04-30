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