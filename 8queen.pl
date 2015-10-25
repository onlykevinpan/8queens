:- use_module(library(clpfd)).
%library
valid_queen((Row,Col)):-
    Range = [1,2,3,4,5,6,7,8],
    member(Row,Range),member(Col,Range).
%指定範圍
valid_board([]).
valid_board([Head|Tail]):- valid_queen(Head),valid_board(Tail).
%棋盤
rows([],[]).
rows([(Row,_)|QueensTail],[Row|RowsTail]):-
    rows(QueensTail,RowsTail).
%檢查x座標
cols([],[]).
cols([(_,Col)|QueensTail],[Col|ColsTail]):-
    cols(QueensTail,ColsTail).
%檢查y座標
diags1([],[]).
diags1([(Row,Col)|QueensTail],[Diagonal|DiagonalsTail]):-
    Diagonal is Col + Row,
    diags1(QueensTail,DiagonalsTail).
%檢查左上到右下
diags2([],[]).
diags2([(Row,Col)|QueensTail],[Diagonal|DiagonalsTail]):-
    Diagonal is Col - Row,
    diags2(QueensTail,DiagonalsTail).
%檢查左下到右上
eight_queens(Board) :-
    length(Board,8),
    valid_board(Board),
%程式輸入點
    rows(Board,Rows),
    cols(Board,Cols),
    diags1(Board,Diags1),
    diags2(Board,Diags2),

    all_different(Rows),
    all_different(Cols),
    all_different(Diags1),
    all_different(Diags2).
%all_different檢查是否相同 PS:需要library(clpfd)
