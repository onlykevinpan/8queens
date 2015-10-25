:- use_module(library(clpfd)).
%library
valid_queen((Row,Col)):-
    Range = [1,2,3,4,5,6,7,8],
    member(Row,Range),member(Col,Range).
%���w�d��
valid_board([]).
valid_board([Head|Tail]):- valid_queen(Head),valid_board(Tail).
%�ѽL
rows([],[]).
rows([(Row,_)|QueensTail],[Row|RowsTail]):-
    rows(QueensTail,RowsTail).
%�ˬdx�y��
cols([],[]).
cols([(_,Col)|QueensTail],[Col|ColsTail]):-
    cols(QueensTail,ColsTail).
%�ˬdy�y��
diags1([],[]).
diags1([(Row,Col)|QueensTail],[Diagonal|DiagonalsTail]):-
    Diagonal is Col + Row,
    diags1(QueensTail,DiagonalsTail).
%�ˬd���W��k�U
diags2([],[]).
diags2([(Row,Col)|QueensTail],[Diagonal|DiagonalsTail]):-
    Diagonal is Col - Row,
    diags2(QueensTail,DiagonalsTail).
%�ˬd���U��k�W
eight_queens(Board) :-
    length(Board,8),
    valid_board(Board),
%�{����J�I
    rows(Board,Rows),
    cols(Board,Cols),
    diags1(Board,Diags1),
    diags2(Board,Diags2),

    all_different(Rows),
    all_different(Cols),
    all_different(Diags1),
    all_different(Diags2).
%all_different�ˬd�O�_�ۦP PS:�ݭnlibrary(clpfd)
