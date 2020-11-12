//
//  Chessboard.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import SwiftUI

struct BoardView: View {
    
    @ObservedObject private var game = CurrentGameState()
    
    public init() {
        self.game.startGame()
    }

    public var body: some View {
        VStack(spacing: 0.0) {
            ForEach((0 ..< 8).reversed(), id: \.self) { rank in
                HStack(spacing: 0.0) {
                    ForEach((0 ..< 8), id: \.self) { file in
                        SquareView(square: self.game.board.position[rank][file])
                    }
                }.frame(width: 60 * 8, height: 60)
            }
        }
    }
}

struct Board_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BoardView()
        }
    }
}
