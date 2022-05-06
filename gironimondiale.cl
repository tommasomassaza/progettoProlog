
team(milan;inter;napoli;juventus;roma;lazio;fiorentina;atalanta;verona;torino;sassuolo;udinese;bologna;empoli;sampdoria;spezia,cagliari,salernitana,genoa,venezia).
in(milan,Milano).
in(inter,Milano).
in(napoli,Napoli).
in(juventus,Torino).
in(roma,Roma).
in(lazio,Roma).
in(fiorentina,Firenze).
in(atalanta,Bergamo).
in(verona,Verona).
in(torino,Torino).
in(sassuolo,Sassuolo).
in(udinese,Udine).
in(bologna,Bologna).
in(empoli,Empoli).
in(sampdoria,Genova).
in(spezia,Spezia).
in(cagliari,Cagliari).
in(salernitana,Salerno).
in(genoa,Genova).
in(venezia,Venezia).
giornateandata(1..19).
giornateritorno(1..19).



1 {partita(Squadra1,Squadra2,N):giornateandata(N),Squadra1<>Squadra2} 1:-team(Squadra1),team(Squadra2).
1 {partita(Squadra1,Squadra2,N):giornateritorno(N),Squadra1<>Squadra2} 1:-team(Squadra1),team(Squadra2).

:-giornata(N),quantiCont(N,DivCont),DivCont<3.




















1 {assegna(Squadra,N):girone(N)} 1:-team(Squadra).
4 {assegna(Squadra,N):team(Squadra)} 4:-girone(N). 

quantiCont(N,DiversiContinenti):-girone(N),DiversiContinenti = #count{Continente:assegna(S,N),in(S,Continente)}.

:-girone(N),team(S1),team(S2),assegna(S1,N),assegna(S2,N),S1<>S2,testaDiSerie(S1),testaDiSerie(S2).
:-girone(N),quantiCont(N,DivCont),DivCont<3.



% con questo è unsatisfiable
%:-girone(N),team(S1),team(S2),assegna(S1,N),assegna(S2,N),S1<>S2,in(S1,C),in(S2,C).

#show assegna/2.



