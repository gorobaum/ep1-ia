% pos_terminator( Y, Y1 ) --> termo( Y ).
% termo( Y ) --> [pos(Y)],
% termo( Y ) --> termo( Y ).

analisador_semantico( Sintaticos, Semanticos, Resolvidos ) :-
    anasem( Semanticos, Sintaticos, [] ).

anasem( I ) --> [soma( S1, S2 )], anasem( S1 ), anasem( S2 ), {I is S1 + S2}.
anasem( I ) --> [sub( S1, S2 )], anasem( S1 ), anasem( S2 ), {I is S1 - S2}.
anasem( I ) --> [mult( S1, S2 )], anasem( S1 ), anasem( S2 ), {I is S1 * S2}.
anasem( I ) --> [div( S1, S2 )], anasem( S1 ), anasem( S2 ), {I is S1 / S2}.
% anasem( I ) --> [pos(F)],{ nth1(F, R, Z) }, {I is Z}.
anasem( D ) --> num(D).

num( D ) --> [D], { digito(D) }.

teste2:-
    analisador_lexico( '= 1 + 2', Y1 ),
    analisador_sintatico( Y1, Y2 ),
    analisador_semantico( Y2, F, [] ),
    writeq(F),
    nl.
