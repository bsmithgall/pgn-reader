//
//  Piece.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/12/20.
//

import Foundation
import SwiftUI

public enum PieceType {
    case pawn;
    case rook;
    case knight;
    case bishop;
    case queen;
    case king;
}

public enum PieceColor {
    case black; case white;
}

public struct Piece {
    public let type: PieceType;
    public let color: PieceColor;
    
    init(shorthand: String) {
        if (shorthand)
    }
    
    init(type: PieceType, color: PieceColor) {
        self.type = type;
        self.color = color;
    }
    
    public func imageName() -> String {
        let typeAbr = String(describing: self.type).prefix(0)
        let colorAbr = String(describing: self.color).prefix(0)
        
        return "\(typeAbr)\(colorAbr)"
    }
}
