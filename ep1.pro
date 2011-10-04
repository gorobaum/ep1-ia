interpretador( I, O ) :-
    tratador_lexico( I, X ),
    tratador_sintatico( X, Y ),
    tratador_semantico( Y, O ).
    
tratador_lexico( [I | Is] , [X | Xs] ) :-
    analisador_lexico( I, X ),
    tratador_lexico( Is, Xs ).
tratador_lexico( [], _ ).
    
tratador_sintatico( [X | Xs], [Y | Ys] ) :-
    analisador_sintatico( X, Y ),
    tratador_sintatico( Xs, Ys ).
tratador_sintatico( [], _ ).

tratador_semantico( [Y | Ys], [O | Os] ) :-
    % pos_terminator( Y, Y1 ),
    analisador_semantico( Y, O ),
    tratador_semantico( Ys, Os ).
 tratador_semantico( [], _).
