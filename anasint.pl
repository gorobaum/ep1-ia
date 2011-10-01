inicio( I ) --> [=], expressao(I)

fator( F ) --> [int(F)].
fator (pos( F )) --> [pos( F )].
expressao( E ) --> parcela( E ).
expressao( som( E1, E2 ) ) --> parcela(E1), [+], expressao(E2).
expressao( sub( E1, E2 ) ) --> parcela(E1), [-], expressao(E2).
expressao( E ) --> ['('], expresao( E ), [')'].
parcela( P ) --> fator( P ).
parcela( P ) --> ['('], expresao( P ), [')'].
parcela( P1, P2 ) --> fator(P1), [*], parcela(P2).
parcela( P1, P2 ) --> fator(P1), [/], parcela(P2).
