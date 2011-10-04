% pos_terminator( Y, Y1 ) --> termo( Y ).
% termo( Y ) --> [pos(Y)],
% termo( Y ) --> termo( Y ).

analisador_semantico( Sintaticos, Semanticos ) :-
    anasem( Semanticos, Sintaticos, [] ).
    
anasem( I ) --> soma( S1, S2 ), anasem( S1 ), anasem( S2 ), ( I is S1 + S2).
anasem( I ) --> sub( S1, S2 ), anasem( S1 ), anasem( S2 ), ( I is S1 - S2).
anasem( I ) --> mult( S1, S2 ), anasem( S1 ), anasem( S2 ), ( I is S1 * S2).
anasem( I ) --> div( S1, S2 ), anasem( S1 ), anasem( S2 ), ( I is S1 / S2).
anasem( D ) --> [ D ], { digito( D ) }.
