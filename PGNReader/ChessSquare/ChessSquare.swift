//
//  ChessSquare.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import SwiftUI
import Foundation

public enum ChessPiece {
    case wp; case bp // pawns
    case wn; case bn // knights
    case wb; case bb // bishops
    case wr; case br // rooks
    case wq; case bq // queens
    case wk; case bk // kings
}

fileprivate let BLACK: Color = Color.init(red: 104 / 255, green: 146 / 255, blue: 168 / 255, opacity: 1)
fileprivate let WHITE: Color = Color.white

public struct ChessSquare: Hashable {
    public let rank: Int
    public let file: Int
    public var piece: ChessPiece?
    
    public init(rank: Int, file: Int) {
        self.rank = rank
        self.file = file
        self.piece = nil
    }
    
    public init(rank: Int, file: Int, piece: ChessPiece) {
        self.init(rank: rank, file: file)
        self.piece = piece
    }
    
    // a1 --> black, a2 --> white, b1 --> white, b2 --> black
    public func color() -> Color {
        if (self.rank % 2 == 0) {
            return self.file % 2 == 0 ? BLACK : WHITE
        } else {
            return self.file % 2 == 0 ? WHITE : BLACK
        }
    }
}
