//
//  ChessBoard.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import Foundation
import SwiftUI

public struct Chessboard: Shape {
    let rows: Int = 8
    let cols: Int = 8
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / CGFloat(rows)
        let colSize = rect.width / CGFloat(cols)
        
        for row in 0 ..< rows {
            for col in 0 ..< cols {
                var square = ChessSquare(rank: row, file: col)
                square.setPiece(piece: ChessPiece.wp)
                // this adds a new white rect over top of the existing rect, so we want to draw
                // these where rank + file is not divisible by two, otherwise the color scheme
                // is incorrect
                
                let rendered = square.render(squareSize: rowSize)
                
                rendered.position(x: colSize * CGFloat(col), y: rowSize * CGFloat(row))
                rendered.
                path.addRect(rendered)
            }
        }
        
        return path
    }
}

struct ChessBoard_Previews: PreviewProvider {
    static var previews: some View {
        Chessboard().fill(Color.init(red: 104 / 255, green: 146 / 255, blue: 168 / 255, opacity: 1)).frame(width: 600, height: 600)
    }
}
