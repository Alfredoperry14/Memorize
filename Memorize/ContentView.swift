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
            CardView(isFaceUp: true)
            CardView()
            CardView(isFaceUp: true)
            CardView()
        }
        .foregroundStyle(Color.orange)
        .padding()
        
    }
}

struct CardView: View{
    
    var isFaceUp: Bool = false
    
    var body: some View{
        ZStack {
            if isFaceUp{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }
            else{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.orange)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
            }
        }
    }
}


#Preview {
    ContentView()
}
