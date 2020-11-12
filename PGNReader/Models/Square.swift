//
//  Square.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/12/20.
//

import Foundation
import SwiftUI

public enum SquareColor {
    case BLACK; case WHITE;
}

public struct Square {
    public let rank: Int
    public let file: Int
    public var piece: Piece?
    
    public init(rank: Int, file: Int) {
        self.rank = rank
        self.file = file
        self.piece = nil
    }
    
    public init(rank: Int, file: Int, piece: Piece) {
        self.init(rank: rank, file: file)
        self.piece = piece
    }
    
    // a1 --> black, a2 --> white, b1 --> white, b2 --> black
    public func color() -> SquareColor {
        if (self.rank % 2 == 0) {
            return self.file % 2 == 0 ? SquareColor.BLACK : SquareColor.WHITE
        } else {
            return self.file % 2 == 0 ? SquareColor.WHITE : SquareColor.BLACK
        }
    }
}
