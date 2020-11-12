//
//  Chessboard.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import SwiftUI

struct ChessboardView: View {
    private var squares: [[ChessSquareView]] = []
    private var chessboard: Chessboard = Chessboard()
    
    public init() {
        self.chessboard.refreshGameState()
        self.squares = self.chessboardToSquares()
    }

    public var body: some View {
        VStack(spacing: 0.0) {
            ForEach((0 ..< 8).reversed(), id: \.self) { rank in
                HStack(spacing: 0.0) {
                    ForEach((0 ..< 8), id: \.self) { file in
                        squares[rank][file]
                    }
                }.frame(width: 60 * 8, height: 60)
            }
        }
    }

    private func chessboardToSquares() -> [[ChessSquareView]] {
        var squares: [[ChessSquareView]] = []
        for rank in 0 ..< 8 {
            var rankSquareView: [ChessSquareView] = []
            for file in 0 ..< 8 {
                rankSquareView.append(
                    ChessSquareView(square: chessboard.gameSquares[rank][file]))
            }
            
            squares.append(rankSquareView)
        }
        
        return squares
    }
}

struct Chessboard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChessboardView()
        }
    }
}
