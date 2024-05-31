//
//  ContentView.swift
//  Memorize
//
//  Created by Alfredo Perry on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        HStack{
            let emojis: [String] = ["👻","🎃","🕷️","😈","👻"]
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index], isFaceUp: true)

            }
        }
        .foregroundStyle(Color.orange)
        .padding()
        
    }
}

struct CardView: View{
    var content: String
    @State var isFaceUp: Bool = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            else{
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}


#Preview {
    ContentView()
}
