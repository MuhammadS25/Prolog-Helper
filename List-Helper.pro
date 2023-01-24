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
nondeterm del(ilist,integer,ilist)
nondeterm d1(ilist,integer,ilist)
nondeterm replace(ilist,integer,integer,ilist)
nondeterm sum(ilist,ilist,ilist)
nondeterm eq(ilist,ilist)
nondeterm last(ilist,integer)

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

d1([],_,[]).
d1([H|T],H,T):-!.
d1([H|T],X,[H|T1]):-d1(T,X,T1).

del([],_,[]).
del([H|T],H,T1):-!,del(T,H,T1).
del([H|T],X,[H|T1]):-del(T,X,T1).

replace([],_,_,[]):-!.
replace([H|T],H,R,[R|T1]):-replace(T,H,R,T1),!.
replace([H|T],X,R,[H|L]):-replace(T,X,R,L).

sum([],[],[]).
sum([H|T],[X|Y],[S|T1]):-S=H+X,sum(T,Y,T1).

eq([],_).
eq([H|T],L):-member(L,H),eq(T,L).

last([H|[]],H).
last([_|T],X):-last(T,X).

goal
%d1([1,2,1,1,1],1,X).
%replace([1,2,3,2,2,2,2],2,0,X).
%index([1,2,3],X,0). 
%last([1,2,30],X).
%eq([1,2,3,4],[2,2,3,3,1]).
%max([1,2,3,4],M).
%delete(5,[5,6,7,5],R).
%-------------------------------------%
%Built-ins 
%Upper_lower("ABC",X).
%Fronttoken("ab cd",Y,X).
%Frontstr(2,"abcde",X,Y). % X=ab Y=cde
%Frontstr(3,S,"ibr","ahim"). % Error
%Fronttoken("cdef",X,Y). % X=cdef Y=
%Frontchar(X,'a',"yat"). %ayat
%str_len("ab",X). %2
%str_len("ab",3). %NO
%str_len(X,3).
%Upper_lower(X,3).