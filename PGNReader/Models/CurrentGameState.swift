//
//  CurrentGameState.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/12/20.
//

import Foundation

class CurrentGameState: ObservableObject {
    @Published var board = Board()
    
    func clearBoard() {
        DispatchQueue.main.async {
            self.board.clearBoard()
        }
    }
    
    func startGame() {
        DispatchQueue.main.async {
            self.board.resetToStart()
        }
    }
}
