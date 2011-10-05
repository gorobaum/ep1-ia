% pos_terminator( Y, Y1 ) --> termo( Y ).
% termo( Y ) --> [pos(Y)],
% termo( Y ) --> termo( Y ).

analisador_semantico( Sintaticos, Semanticos, Resolvidos ) :-
    anasem( Semanticos, Sintaticos, Resolvidos, [] ).

anasem( I, R ) --> [soma( S1, S2 )], anasem( S1, R ), anasem( S2, R ), {I is S1 + S2}.
anasem( I, R ) --> [sub( S1, S2 )], anasem( S1, R ), anasem( S2, R ), {I is S1 - S2}.
anasem( I, R ) --> [mult( S1, S2 )], anasem( S1, R ), anasem( S2, R ), {I is S1 * S2}.
anasem( I, R ) --> [div( S1, S2 )], anasem( S1, R ), anasem( S2, R ), {I is S1 / S2}.
anasem( I, R ) --> [pos(F)],{ nth1(F, R, Z) }, {I is Z}.
anasem( D ) --> num(D).

num( D ) --> [D], { digito(D) }.

teste2:-
    analisador_lexico( '= 1 + 2 - 3 * 3', Y1 ),
    analisador_sintatico( Y1, Y2 ),
    analisador_semantico( Y2, F, [] ),
    writeq(F),
    nl.
