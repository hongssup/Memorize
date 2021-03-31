//
//  ContentView.swift
//  Memorize
//
//  Created by SeoYeon Hong on 2021/03/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack() { //(spacing: 0)
            ForEach(0..<4) { index in
                CardView()
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text("👻")
            } else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
