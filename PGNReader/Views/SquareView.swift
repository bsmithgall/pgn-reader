//
//  ChessSquareView.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import SwiftUI

fileprivate let BLACK: Color = Color.init(red: 104 / 255, green: 146 / 255, blue: 168 / 255, opacity: 1)
fileprivate let WHITE: Color = Color.white

fileprivate let colorMap: [SquareColor: Color] = [
    SquareColor.BLACK: BLACK,
    SquareColor.WHITE: WHITE
]

public struct SquareView: View {
    private let square: Square
    private let squareSize: CGFloat
    private let squareColor: Color
    
    public init(square: Square, squareSize: CGFloat = 60.0) {
        self.square = square
        self.squareSize = squareSize
        self.squareColor = colorMap[square.color()]!
    }
    
    public var body: some View {
        if (self.square.piece == nil) {
            return AnyView(
                Rectangle()
                    .size(width: self.squareSize, height: self.squareSize)
                    .fill(self.squareColor)
            )
        }
        
        return AnyView(
            Image(String(describing: self.square.piece!))
                .resizable()
                .frame(width: self.squareSize, height: self.squareSize)
                .background(Rectangle().fill(self.squareColor))
        )
    }
}

struct ChessSquareView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 0) {
            SquareView(square: Square(rank: 0, file: 0, piece: Piece.wr))
            SquareView(square: Square(rank: 0, file: 1, piece: Piece.wn))
            SquareView(square: Square(rank: 0, file: 2, piece: Piece.wb))
            SquareView(square: Square(rank: 0, file: 3, piece: Piece.wq))
            SquareView(square: Square(rank: 0, file: 4, piece: Piece.wk))
            SquareView(square: Square(rank: 0, file: 5, piece: Piece.wb))
            SquareView(square: Square(rank: 0, file: 6, piece: Piece.wn))
            SquareView(square: Square(rank: 0, file: 7, piece: Piece.wr))
        }
    }
}
