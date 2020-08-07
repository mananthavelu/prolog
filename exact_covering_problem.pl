%Sub question -1 & 2 - List and list of lists

%Sub question-3 - predicate 'iscovered/3'.

iscovered(_,[],[]).

iscovered(I,[H|_],Result):-
    member(I,H),Result=H.

iscovered(I,[H|T],Result):-
    \+member(I,H),iscovered(I,T,Result).

%Residual is understood as the remaining elements here . Not sure though.

residual(Is,I,Os,O,RIs,ROs):-remove(Is,I,RIs),remove(Os,O,ROs).

remove([X],X,[]).
remove([X|T],X,T).
remove([_|T],X,Result):-remove(T,X,Result).

member(X,[X|_]).
member(X,[_|T]):-member(X,T).

%Result
%residual([a,b,c,d,e],a,[[a,b],[d,f,e,g]],[a,b],RIs,ROS)
%[b, c, d, e]
%[[d, f, e, g]]
