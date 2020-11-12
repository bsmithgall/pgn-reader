//
//  Board.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/12/20.
//

import Foundation

public enum Piece {
    case wp; case bp // pawns
    case wn; case bn // knights
    case wb; case bb // bishops
    case wr; case br // rooks
    case wq; case bq // queens
    case wk; case bk // kings
}

let files = ["a", "b", "c", "d", "e", "f", "g", "h"]
fileprivate let WHITE_PIECE_ORDER: [Piece] = [Piece.wr, Piece.wn, Piece.wb, Piece.wq, Piece.wk, Piece.wb, Piece.wn, Piece.wr]
fileprivate let BLACK_PIECE_ORDER: [Piece] = [Piece.br, Piece.bn, Piece.bb, Piece.bq, Piece.bk, Piece.bb, Piece.bn, Piece.br]

public class Board {
    public var position: [[Square]] = []

    init() {
        self.position = self.startingPosition()
    }

    public func move() {}

    public func resetToStart() {
        self.position = self.startingPosition()
    }

    public func clearBoard() {
        self.position = self.emptyGameState()
    }

    private func emptyGameState() -> [[Square]] {
        var squares: [[Square]] = []
        for rank in 0 ..< 8 {
            var rankSquares: [Square] = []
            for file in 0 ..< 8 {
                rankSquares.append(Square(rank: rank, file: file))
            }
            squares.append(rankSquares)
        }

        return squares
    }

    private func startingPosition() -> [[Square]] {
        var squares: [[Square]] = []
        for rank in 0 ..< 8 {
            var rankSquares: [Square] = []
            for file in 0 ..< 8 {
                if (rank == 0) {
                    rankSquares.append(Square(rank: rank, file: file, piece: WHITE_PIECE_ORDER[file]))
                } else if (rank == 1) {
                    rankSquares.append(Square(rank: rank, file: file, piece: Piece.wp))
                } else if (rank == 6) {
                    rankSquares.append(Square(rank: rank, file: file, piece: Piece.bp))
                } else if (rank == 7) {
                    rankSquares.append(Square(rank: rank, file: file, piece: BLACK_PIECE_ORDER[file]))
                } else if (rank > 2 || rank < 6) {
                    rankSquares.append(Square(rank: rank, file: file))
                }
            }
            squares.append(rankSquares)
        }

        return squares
    }
}

