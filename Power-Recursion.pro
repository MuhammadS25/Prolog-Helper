
predicates
power(integer,integer,integer)
clauses
power(_,0,Y):-!,Y=1.
power(X,1,Y):-!,Y=X.
power(X,N,Y):-Z=N-1,power(X,Z,NZ),Y=X*NZ.
goal
power(2,2,M).


C:\Users\MoSabry25\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Visual Prolog 5.2 Personal Edition
