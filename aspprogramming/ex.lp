% blocks.lp with limited number of blocks on the table 
% Define the blocks 
block(a). block(b). block(c). block(d). block(e). block(f). 
% Define the table 
table. 
% Define the initial state 
on(a, table, 0). on(b, a, 0). on(c, b, 0). on(d, c, 0). on(e, d, 0). on(f, e, 0). 
% Define the goal state 
goal :- on(f, table, T). 
% Define the actions 
1 { move(X, Y, T) : block(X), block(Y), X != Y, on(X, Z, T), clear(X, T), clear(Y, T-1) } 1 :- T > 0, T <= 4. 
% Define the clear predicate 
clear(X, T) :- not on(_, X, T). 
% Define the successor state axioms 
on(X, Y, T+1) :- move(X, Y, T), on(X, Z, T), clear(Y, T-1). 
on(X, Y, T) :- on(X, Y, T+1), not move(X, _, T). 
on(X, table, T+1) :- move(X, table, T), on(X, Z, T), clear(table, T-1). 
on(X, table, T) :- on(X, table, T+1), not move(X, _, T). 
% Define the plan
 #show move/3.