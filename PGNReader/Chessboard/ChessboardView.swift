//
//  Chessboard.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import SwiftUI

struct ChessboardView: View {
    
    @ObservedObject private var gameState = CurrentGameState()
    
    public init() {
        self.gameState.startGame()
    }

    public var body: some View {
        VStack(spacing: 0.0) {
            ForEach((0 ..< 8).reversed(), id: \.self) { rank in
                HStack(spacing: 0.0) {
                    ForEach((0 ..< 8), id: \.self) { file in
                        ChessSquareView(square: self.gameState.chessboard.position[rank][file])
                    }
                }.frame(width: 60 * 8, height: 60)
            }
        }
    }
}

struct Chessboard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ChessboardView()
        }
    }
}
