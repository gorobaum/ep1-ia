analisador_semantico( Sintaticos, Valor, Resolvidos ) :-
    anasem( Valor, Sintaticos, Resolvidos ).

anasem(Valor, Sintaticos, _) :-
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
