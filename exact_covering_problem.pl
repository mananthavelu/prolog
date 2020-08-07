iscovered(_,[],[]).
iscovered(I,[H|_],Result):-
    member(I,H),Result=H.
iscovered(I,[H|T],Result):-
    \+member(I,H),iscovered(I,T,Result).

%Residual is understood as the remaining elements here . Not sure though.
residual(Is,I,Os,O,RIs,ROs):-remove(Is,I,RIs),remove(Os,O,ROs).

%Sub Question-5
findexactcovering(Is,Os,Result):-count2(Is,N),findall(Result_subsets,(subset(Os,Result_subsets)),Subsets),
    findall(H,(member(H,Subsets),flatten(H,ResultH),count2(ResultH,N1),N=N1,same_elements(ResultH,Is)),Result).

same_elements([], []).
same_elements([H1|T1], L2) :- 
   count2([H1|T1], X),
   count2(L2, Y),
   Y = X,
   member(H1, L2),
   myremove(H1, L2, Nl2),
   same_elements(T1, Nl2).

count2([],0).
count2([_|T],N) :- count2(T,N1), N is N1 + 1.

myremove(X, [X|T], T).   
myremove(X, [H|T], [H|R]) :-
   myremove(X, T, R).

remove([X],X,[]).
remove([X|T],X,T).
remove([_|T],X,Result):-remove(T,X,Result).

member(X,[X|_]).
member(X,[_|T]):-member(X,T).

%Subseting a list

subset([],[]).
subset([First|Rest], [First|Sub]):-subset(Rest, Sub).
subset([First|Rest], Sub):- subset(Rest, Sub).

%Flattening the list

flatten([], []).
flatten(X, [X]) :- 
	atomic(X), X  \== [].
flatten([H|T], L3) :-
	flatten(H, L1), flatten(T, L2), append(L1, L2, L3).
       
%Result
%residual([a,b,c,d,e],a,[[a,b],[d,f,e,g]],[a,b],RIs,ROS)
%[b, c, d, e]
%[[d, f, e, g]]
