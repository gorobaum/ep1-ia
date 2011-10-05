% pos_terminator( Y, Y1 ) --> termo( Y ).
% termo( Y ) --> [pos(Y)],
% termo( Y ) --> termo( Y ).

analisador_semantico( Sintaticos, Valor, Resolvidos ) :-
    anasem( Valor, Sintaticos, Resolvidos ).

anasem(Valor, Sintaticos, Resolvidos) :-
  integer(Sintaticos),
  Valor is  Sintaticos.
anasem(Valor, Sintaticos, Resolvidos) :-
  pos(X) = Sintaticos,
  nth1(X, Resolvidos, Y),
  Valor is Y.
anasem(Valor, Sintaticos, Resolvidos) :-
  soma(X,Y) = Sintaticos,
  anasem(Xval,X, Resolvidos),
  anasem(Yval,Y, Resolvidos),
  Valor is Xval + Yval.
anasem(Valor, Sintaticos, Resolvidos) :-
  sub(X,Y) = Sintaticos,
  anasem(Xval,X, Resolvidos),
  anasem(Yval,Y, Resolvidos),
  Valor is Xval - Yval.
anasem(Valor, Sintaticos, Resolvidos) :-
  mult(X,Y) = Sintaticos,
  anasem(Xval,X, Resolvidos),
  anasem(Yval,Y, Resolvidos),
  Valor is Xval * Yval.
anasem(Valor, Sintaticos, Resolvidos) :-
  div(X,Y) = Sintaticos,
  anasem(Xval,X, Resolvidos),
  anasem(Yval,Y, Resolvidos),
  Valor is Xval / Yval.
%anasem( I ) --> calculo( I ).

%calculo( I ) --> [soma( S1, S2 )], calculo( S1 ), calculo( S2 ), {I is S1 + S2}.
%calculo( I ) --> [sub( S1, S2 )], calculo( S1 ), calculo( S2 ), {I is S1 - S2}.
%calculo( I ) --> [mult( S1, S2 )], calculo( S1 ), calculo( S2 ), {I is S1 * S2}.
%calculo( I ) --> [div( S1, S2 )], calculo( S1 ), calculo( S2 ), {I is S1 / S2}.
% anasem( I ) --> [pos(F)],{ nth1(F, R, Z) }, {I is Z}.
%calculo( D ) --> D], { integer(D) }.

% num( D ) --> [D], { digito(D) }.

teste2:-
    analisador_lexico( '= 1 + 2', Y1 ),
    analisador_sintatico( Y1, Y2 ),
    writeq(Y2),
    analisador_semantico( Y2, F ),
    writeq(F),
    nl.
