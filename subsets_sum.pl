%Solution
item(ax,50,40).
item(book,50,50).
item(cookies,10,5).
item(laptop,99,60).

%Creating the subsets of the given elements in a list
subset([],[]).
subset([First|Rest], [First|Sub]):-subset(Rest, Sub).
subset([First|Rest], Sub):- subset(Rest, Sub).

%The solution is considered whereas the input is given as the list of facts
%solve([item(ax,50,40),item(book,50,50),item(cookies,10,5),item(laptop,99,60)],90,40,Result)

solve(List_of_items,W,V,ItemsOut):-findall(L1,subset(List_of_items,L1),Result_combinations),
       findall(H,(member(H,Result_combinations),sum_of_list(H,SumW,SumV),SumW<W,SumV>V),ItemsOut).
sum_of_list([],0,0).
sum_of_list([item(_,W1,V1)|T],SumW,SumV):-sum_of_list(T,SumWTail,SumVTail),SumW is SumWTail+W1,SumV is SumVTail+V1.


%Sub question-3. The highest V value is asked. Highest V Values in the question is bit ambiguous.
highest(List_of_items,HighV):-sort2(List_of_items,Sorted),high_V_value(Sorted,HighV).

%Sorting a list - from exercise sessions - directly taken
sort2(List,List):-
	is_sorted(List).
sort2(List,Result):-
	not(is_sorted(List)),
	switch_unsorted(List,Temp),
	sort2(Temp,Result).

switch_unsorted([], []).
switch_unsorted([X], [X]).
switch_unsorted([X, Y|List], [Y,X|List]):-
	gt(X,Y).
switch_unsorted([X, Y|List], [X|Rlist]):-
	not(gt(X,Y)),
	switch_unsorted([Y|List],Rlist).

is_sorted([]).
is_sorted([_]).
is_sorted([X,Y|List]):-
	not(gt(X,Y)),
	is_sorted([Y|List]).
gt(item(_,_,A),item(_,_,B)):-A>B.

high_V_value([item(_,_,X)],X).
high_V_value([item(_,_,_)|T],X):-high_V_value(T,X).             


%Query
%solve([item(ax,50,40),item(book,50,50),item(cookies,10,5),item(laptop,99,60)],90,40,Result)

%Result
%[[item(ax, 50, 40), item(cookies, 10, 5)], [item(book, 50, 50), item(cookies, 10, 5)], [item(book, 50, 50)]]

%Query - Highest
%highest([item(ax,50,40),item(book,50,50),item(cookies,10,5),item(laptop,99,60)],Result)),write('Highest V value is..'),write(Result)

%Result
%Highest V value is..60
