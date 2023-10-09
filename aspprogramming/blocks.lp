% File: blocks.lp: Blocks World

% sort and object declaration
location(B) :- block(B).
location(table).

% state description
:- 2{on(BB,B,T)}, block(B), T = 0..m.

% effect and preconditions of action
% on(B,L,T+1) :- move(B,L,T).   % Removed
% :- not {move(BB,LL,T)} grippers, T = 0..m-1.  % Removed
:- move(B,L,T), on(B1,B,T).
:- move(B,B1,T), move(B1,L,T).

% domain independent axioms
1{on(B,LL,0):location(LL)}1 :- block(B).
:- not 1{on(B,LL,T)}1, block(B), T=1..m.
% {move(B,L,T)} :- block(B), location(L), T = 0..m-1.  % Removed
% {on(B,L,T+1)} :- on(B,L,T), T < m.   % Removed

#show on/3.