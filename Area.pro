% using compouned objects
Domains
point = pnt(integer,integer)
shape = cir(point,integer); rect(point,point)

predicates
area(shape,real)

clauses
area(rect(pnt(X1, Y1), pnt(X2, Y2)), A) :-
	A is abs(X1 - X2) * abs(Y1 - Y2).
area(circle(R), A) :-
	A is 22/7 * R * R.

goal
	%area(rec(pnt(3,2), pnt(10,20)),A).
	area(cir(pnt(3,4), 5), A).