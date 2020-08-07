solve(N,Sum,FinalResult):-
    create_list(N,L),findall(Result,permute(L,Result),Results),
    findall(H,(member(H,Results),check_sum(H,Sum)),FinalResult).

check_sum(List,Sum):-check_left_to_right(List,Sum),
    last_but_two_elements(List,Result1),first_element(List,Result2),first_two_elements(List,Result3),
    last_element(List,Result4),check_sum(Result1,Result2,Result3,Result4,Sum).

check_left_to_right([_,_],_).
check_left_to_right([H1,H2,H3|T],Sum):-H1+H2+H3>=Sum,check_left_to_right([H2,H3|T],Sum).

%First element
first_element([H],H).
first_element([H|_],H).

%Extract the first two elements of the list
first_two_elements([X1,X2],[X1,X2]).
first_two_elements([H1,H2|_],[H1,H2]).

%Extract the last element from the list
last_element([X],X).
last_element([X|T],Result):-last_element(T,Result).

%Last but 2 elements
last_but_two_elements([X,Y],[X,Y]).
last_but_two_elements([_,H2|T],Result):-last_but_two_elements([H2|T],Result).

%CheckSum
check_sum(List1,Result2,List3,Result4,Sum):-sum_of(List1,Sum1),sum_of(List3,Sum3),Sum1+Result2>=Sum,Sum3+Result4>=Sum.

sum_of([],0).
sum_of([H|T],Result):-sum_of(T,Tc), Result is H+Tc.

create_list(N,L):-findall(N1,between(1,N,N1),L).

permute([],[]).
permute([X|L],P):-permute(L,L1),insert(X,L1,P).

insert(H,L1,L2):-del(H,L2,L1).

del(H,[H|T],T).
del(H,[Y|T],[Y|Tail1]):-del(H,T,Tail1).

/*
%Query
%solve(5,8,FinalResult)
%For big N, the computation becomes expensive.
[[2, 3, 4, 1, 5], [1, 3, 4, 2, 5], [3, 4, 2, 5, 1], [3, 4, 1, 5, 2], [2, 4, 3, 1, 5], [1, 4, 3, 2, 5], [4, 3, 2, 5, 1], [4, 3, 1, 5, 2], [4, 2, 5, 1, 3], 
[4, 1, 5, 2, 3], [3, 2, 5, 1, 4], [3, 1, 5, 2, 4], [2, 5, 1, 3, 4], [1, 5, 2, 3, 4], [5, 2, 3, 4, 1], [5, 1, 3, 4, 2], [2, 5, 1, 4, 3], [1, 5, 2, 4, 3],
[5, 2, 4, 3, 1], [5, 1, 4, 3, 2]]

*/
