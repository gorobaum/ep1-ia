?- include('analex.pro').
?- include('anasint.pro').
?- include('anasem.pro').
?- include('testes.pro').

interpretador( I, O ) :-
    tratador_lexico( I, X ),
    tratador_sintatico( X, Y ),
    tratador_semantico( Y, O, [] ).

tratador_lexico( [], [] ).
tratador_lexico( [I | Is] , [X | Xs] ) :-
    % writeq( I ),
    analisador_lexico( I, X ),
    tratador_lexico( Is, Xs ).

tratador_sintatico( [], [] ).
tratador_sintatico( [X | Xs], [Y | Ys] ) :-
    analisador_sintatico( X, Y ),
    tratador_sintatico( Xs, Ys ),
    !.

tratador_semantico( [], [], _ ).
tratador_semantico( [Y | Ys], [O | Os], R ) :-
    analisador_semantico( Y, O, R ),
    append(R,[O],Z),
    tratador_semantico( Ys, Os, Z ),
    !.
