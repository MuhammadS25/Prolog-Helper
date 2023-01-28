Database - students
	student(integer,symbol,integer,symbol)
predicates
	nondeterm process
	nondeterm perform(char)
Clauses
perform('a'):-
	write("enter student Id:"), readint(A),
	not(student(A,_,_,_)),
	write("enter student name :"), readln(B),
	write("enter student Age :"), readint(C),
	write("enter Address :"), readln(D),
	asserta(student(A,B,C,D)).
	
perform('a'):-
	write("Student already exist\n").

perform('d'):-
	write("enter student Id :"), readint(A),
	retract(student(A,_,_,_)).

perform('d'):-
	write("Student not exist\n").

perform('u'):-
	write("enter student Id :"), readint(A),
	retract(student(A,B,_,_)),
	write("enter student Age :"), readint(C),
	write("enter Address :"), readln(D),
	asserta(student(A,B,C,D)).

perform('u'):-
	write("Student not exist\n").

perform('v'):-
	write(“ id\t name\t Age\t address\n"),
	student(A,B,C,D),
	write(A,"\t",B,"\t",C,"\t",D), nl, fail.

perform('v').

process:-
	write("Add(a),View(v),Delete(d), Update(u),:"),
	readchar(X), write(X), nl, perform(X), process.

process.

goal
	process.