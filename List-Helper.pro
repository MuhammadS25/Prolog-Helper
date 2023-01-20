domains
ilist = integer*
clist = symbol*

predicates

nondeterm len(ilist, integer)
nondeterm append(ilist, ilist, ilist)
nondeterm reverse(ilist, ilist)
nondeterm even(ilist)
nondeterm nth(clist, integer, symbol)
nondeterm swap(ilist, ilist)
nondeterm split(ilist, integer, ilist, ilist, ilist)
nondeterm subset(ilist, ilist)
nondeterm member(ilist, integer)
nondeterm max(ilist,integer)
nondeterm delete(integer,ilist,ilist)
nondeterm replace(ilist,integer,integer,ilist)

clauses

len([], 0):-!.
len([_|T], Ret):-len(T, NewRet), Ret = NewRet + 1.

append([], [], []):-!.
append([], [H|T], Ret):- append([], T, NewRet), Ret = [H | NewRet].
append([H | T], List2, Ret):- append(T, List2, NewRet), Ret = [H | NewRet].

reverse([], []):-!.
reverse([H|T], Ret):- reverse(T, NewRet), append(NewRet, [H], Ret).

even([]):-!.
even([_, _|T]):-even(T).

nth([H|_], 0, H):-!.
nth([_|T], Index, Ret):- NewIndex = Index - 1, nth(T, NewIndex, Ret).

swap([H | T], Ret):- reverse(T, [NewH | NewT]), reverse(NewT, LastT),append([NewH], LastT, TempRet), append(TempRet, [H], Ret). 

split([H| T], H, [], [H], T):-!.
split([H | T], Num, Ret1, Ret2, Ret3):- split(T, Num, NewRet1, Ret2, Ret3), Ret1 = [H | NewRet1].

subset([], _):-!.
subset([H | T], List2):- member(List2, H), subset(T, List2).

member([H | _], H):-!.
member([_ | T], Num):-member(T, Num).

max([H],H).
max([H|T],M):-max(T,NM),NM>=H,M=NM,!.
max([H|[]],M):-M=H.

delete(_,[],[]).
delete(H,[H|T],T1):-!,delete(H,T,T1).
delete(N,[H|T],[H|T1]):-delete(N,T,T1).

replace([],_,_,[]):-!.
replace([H|T],H,R,[R|T1]):-replace(T,H,R,T1),!.
replace([H|T],X,R,[H|L]):-replace(T,X,R,L).

goal
subset([5,6,7, 10] ,[7,2,5,4,6,8]).