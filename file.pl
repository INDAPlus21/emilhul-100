% Taken and modified from https://gist.github.com/MuffinTheMan/7806903
% Get an element from a 2-dimensional list at (Row,Column)
% using 1-based indexing.
nth1_2d(Row, Column, List, Element) :-
    nth1(Row, List, SubList),
    nth1(Column, SubList, Element).

check_visited(Node, [HeadNode | TailNodes]) :- 
    Node = HeadNode;
    check_visited(Node, TailNodes).

% Top-level predicate
alive(Row, Column, BoardFileName) :-
    % Get input as a board in a .txt file
    see(BoardFileName),
    read(Board),
    seen,

    % Validate that there is a stone in the given position
    % Assign stone to it
    nth1_2d(Row, Column, Board, Stone),
    (Stone = b; Stone = w),

    % Call recursive predicate
    check_alive(Row, Column, Board, Stone, []).

% Checks whether the group of stones connected to
% the stone located at (Row, Column) is alive or dead.
check_alive(Row, Column, Board, StoneType, Visited) :-
    % Check what stone the given position has
    nth1_2d(Row, Column, Board, Stone),

    % If is empty return true
    (Stone = e; 
    % If correct stone type
    (Stone = StoneType,
        % And it hasn't been visited
        \+ check_visited((Row, Column), Visited),
        Up is Row - 1,
        Down is Row + 1,
        Left is Column - 1,
        Right is Column + 1,
        % And an adjacent stone (or one of their adjacent stones etc.)
        (
            % Recursively check neighbopurs
            check_alive(Up, Column, Board, StoneType, [(Row, Column) | Visited]);
            check_alive(Down, Column, Board, StoneType, [(Row, Column) | Visited]);
            check_alive(Row, Left, Board, StoneType, [(Row, Column) | Visited]);
            check_alive(Row, Right, Board, StoneType, [(Row, Column) | Visited])
        )
    )).