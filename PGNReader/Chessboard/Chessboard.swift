//
//  Chessboard.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import Foundation

fileprivate let WHITE_PIECE_ORDER: [ChessPiece] = [ChessPiece.wr, ChessPiece.wn, ChessPiece.wb, ChessPiece.wq, ChessPiece.wk, ChessPiece.wb, ChessPiece.wn, ChessPiece.wr]
fileprivate let BLACK_PIECE_ORDER: [ChessPiece] = [ChessPiece.br, ChessPiece.bn, ChessPiece.bb, ChessPiece.bq, ChessPiece.bk, ChessPiece.bb, ChessPiece.bn, ChessPiece.br]

public struct Chessboard: Hashable {
    public var gameSquares: [[ChessSquare]] = []
    
    public init() {
        for rank in 0 ..< 8 {
            var rankSquares: [ChessSquare] = []
            for file in 0 ..< 8 {
                rankSquares.append(ChessSquare(rank: rank, file: file))
            }
            self.gameSquares.append(rankSquares)
        }
    }

    public mutating func refreshGameState() {
        for rank in 0 ..< 8 {
            for file in 0 ..< 8 {
                if (rank == 0) {
                    self.setSquare(rank: rank, file: file, piece: WHITE_PIECE_ORDER[file])
                } else if (rank == 1) {
                    self.setSquare(rank: rank, file: file, piece: ChessPiece.wp)
                } else if (rank == 6) {
                    self.setSquare(rank: rank, file: file, piece: ChessPiece.bp)
                } else if (rank == 7) {
                    self.setSquare(rank: rank, file: file, piece: BLACK_PIECE_ORDER[file])
                } else if (rank > 2 || rank < 6) {
                    self.setSquare(rank: rank, file: file)
                }
            }
        }
    }
     
    
    public mutating func setSquare(rank: Int, file: Int) {
        self.gameSquares[rank][file] = ChessSquare(rank: rank, file: file)
    }

    public mutating func setSquare(rank: Int, file: Int, piece: ChessPiece) {
        self.gameSquares[rank][file] = ChessSquare(rank: rank, file: file, piece: piece)
    }
}
