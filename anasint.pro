analisador_sintatico( Lexicos, Sintaticos ) :-
    anasin( Sintaticos, Lexicos, []).

anasin( I ) --> [=], expressao(I).

expressao( E ) --> parcela( E ).
expressao( soma( E1, E2 ) ) --> parcela(E1), [+], expressao(E2).
expressao( sub( E1, E2 ) ) --> parcela(E1), [-], expressao(E2).
expressao( E ) --> ['('], expressao( E ), [')'].

parcela( P ) --> fator( P ).
parcela( mult(P1, P2) ) --> fator(P1), [*], expressao(P2).
parcela( div(P1, P2) ) --> fator(P1), [/], expressao(P2).

fator( F ) --> [int(F)].
fator( pos( F ) ) --> [pos(F)].

teste1:-
    analisador_lexico( '= 1 + 2', Ys ),
    analisador_sintatico( Ys, F ),
    writeq(F),
    nl.
