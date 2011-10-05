analisador_sintatico( Lexicos, Sintaticos ) :-
    anasin( Sintaticos, Lexicos, []).

anasin( I ) --> [=], expressao(I).

expressao( E ) --> parcela( E ).
expressao( E ) --> ['('], expresao( E ), [')'].
expressao( som( E1, E2 ) ) --> parcela(E1), [+], expressao(E2).
expressao( sub( E1, E2 ) ) --> parcela(E1), [-], expressao(E2).

parcela( P ) --> fator( P ).
parcela( P ) --> ['('], expresao( P ), [')'].
parcela( mult(P1, P2) ) --> fator(P1), [*], parcela(P2).
parcela( div(P1, P2) ) --> fator(P1), [/], parcela(P2).

fator( F ) --> [int(F)].
fator( pos( F ) ) --> [pos(F)].

teste1:-
    analisador_lexico( '= 1 + 2', Ys ),
    analisador_sintatico( Ys, F ),
    nl.
