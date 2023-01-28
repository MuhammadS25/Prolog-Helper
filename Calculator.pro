prediactes

	nondeterm calc(real,real,real,integer)
	nondeterm run

clauses

calc(X,Y,R,C):-
	C = 1,!,R = X + Y, write(R),nl.

calc(X,Y,R,C):-
	C = 2,!,R = X - Y, write(R),nl.

calc(X,Y,R,C):-
	C = 3,!,R = X * Y, write(R),nl.

calc(X,Y,R,C):-
	C = 4,!, Y<>0 ,R = X / Y, write(R),nl.

run:-
	write("Choose number for operation"),nl,
	write("1) Addition"),nl,
	write("2) Subtraction"),nl,
	write("3) Multiplication"),nl,
	write("4) Division"),nl,
	readint(C),
	write("Enter first number"),nl,
	readreal(A),nl,
	write("Enter second number"),nl,
	readreal(B),nl,
	calc(A,B,R,C),
	write("Do you want to continue (Y/N) "),nl,
	readchar(CC),nl,CC=Y,
	run.

goal
	run.