//
//  ChessSquareView.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import SwiftUI

public struct ChessSquareView: View {
    private let square: ChessSquare
    private let squareSize: CGFloat
    
    public init(square: ChessSquare, squareSize: CGFloat = 60.0) {
        self.square = square
        self.squareSize = squareSize
    }
    
    public var body: some View {
        if (self.square.piece == nil) {
            return AnyView(
                Rectangle()
                    .size(width: self.squareSize, height: self.squareSize)
                    .fill(self.square.color()))
        }
        
        return AnyView(
            Image(String(describing: self.square.piece!))
                .resizable()
                .frame(width: self.squareSize, height: self.squareSize)
                .background(Rectangle().fill(self.square.color()))
        )
    }
}

struct ChessSquareView_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 0) {
            ChessSquareView(square: ChessSquare(rank: 0, file: 0, piece: ChessPiece.wr))
            ChessSquareView(square: ChessSquare(rank: 0, file: 1, piece: ChessPiece.wn))
            ChessSquareView(square: ChessSquare(rank: 0, file: 2, piece: ChessPiece.wb))
            ChessSquareView(square: ChessSquare(rank: 0, file: 3, piece: ChessPiece.wq))
            ChessSquareView(square: ChessSquare(rank: 0, file: 4, piece: ChessPiece.wk))
            ChessSquareView(square: ChessSquare(rank: 0, file: 5, piece: ChessPiece.wb))
            ChessSquareView(square: ChessSquare(rank: 0, file: 6, piece: ChessPiece.wn))
            ChessSquareView(square: ChessSquare(rank: 0, file: 7, piece: ChessPiece.wr))
        }
    }
}
