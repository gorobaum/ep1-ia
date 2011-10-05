?- include('analex-ep1.pro').
?- include('anasint.pro').
?- include('anasem.pro').

interpretador( I, O ) :-
    tratador_lexico( I, X ),
    tratador_sintatico( X, Y ),
    tratador_semantico( Y, O, [] ).
    
tratador_lexico( [I | Is] , [X | Xs] ) :-
    analisador_lexico( I, X ),
    tratador_lexico( Is, Xs ).
tratador_lexico( [], _ ).

tratador_sintatico( [], _ ).    
tratador_sintatico( [X | Xs], [Y | Ys] ) :-
    analisador_sintatico( X, Y ),
    tratador_sintatico( Xs, Ys ).


tratador_semantico( [Y | Ys], [O | Os], R ) :-
    % pos_terminator( Y, Y1 ),
    analisador_semantico( Y, O, R ),
    tratador_semantico( Ys, Os, [ R | O ] ).
 tratador_semantico( [], _).
 
testefinal :-
    interpretador( ['1'], [1] ).
