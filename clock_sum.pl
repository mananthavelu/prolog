check_sum(List,Sum):-check_left_to_right(List,Sum),
    last_but_two_elements(List,Result1),first_element(List,Result2),check_sum(Result1,Result2,Sum).

check_left_to_right([_,_],_).
check_left_to_right([H1,H2,H3|T],Sum):-H1+H2+H3>=Sum,check_left_to_right([H2,H3|T],Sum).

%Last but 2 elements
last_but_two_elements([X,Y],[X,Y]).
last_but_two_elements([_,H2|T],Result):-last_but_two_elements([H2|T],Result).

%First element
first_element([H],H).
first_element([H|_],H).

%CheckSum
check_sum(List1,Result2,Sum):-sum_of(List1,Sum1),Sum1+Result2>=Sum.
sum_of([],0).
sum_of([H|T],Result):-sum_of(T,Tc), Result is H+Tc.
