testes :-
    teste1,
    teste2,
    teste3,
    teste4,
    teste5.

teste1 :-
    interpretador(['2','3','= 3 + 10/($1 + $2)', '= 3 + $3 * 2'], [2,3,5,13] ).

teste2 :-
    interpretador( ['= 1 + 2', '2', '$1'], [3,2,3] ).
    
teste3 :-
    interpretador( [], [] ).
    
teste4 :-
    interpretador( ['1','2','3','4','5','6','7','8','9','= $1 + $2 + $3 + $4 + $5 + $6 + $ 7 + $8 + $9'], [1,2,3,4,5,6,7,8,9,45]).
    
teste5 :-
    interpretador( ['1','= $1 + 2', '= %2 - 2', '= $3 * 2', '= $4 / 2'], [1,3,1,2,1]).

