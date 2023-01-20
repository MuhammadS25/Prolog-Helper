predicates
nondeterm fib(integer,integer)
clauses
fib(0,Y):-Y=1,!.
fib(1,Y):-Y=1,!.
fib(X,Y):-Z=X-1,fib(Z,NZ),V=Z-1,fib(V,NV),Y=NZ+NV.
goal
fib(3,Y).