//
//  ContentView.swift
//  PGNReader
//
//  Created by Ben Smithgall on 11/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ChessboardView()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
