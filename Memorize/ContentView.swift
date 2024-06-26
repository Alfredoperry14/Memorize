//
//  ContentView.swift
//  Memorize
//
//  Created by Alfredo Perry on 5/29/24.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["🤽‍♀️","🏄‍♂️","🚴‍♂️","⛹️","🤽‍♀️","🏄‍♂️","🚴‍♂️","⛹️"]
    @State var theme: Color = .yellow
    @State var cardCount = 8
    
    var body: some View {
        VStack{
            Text("Memorize!")
                .font(.largeTitle)
                .bold()
            ScrollView{
                cards(cardCount: $cardCount, theme: $theme, emojis: $emojis)
            }
            Spacer()
            themeSelector(emojis: $emojis, theme: $theme)
        }
        .padding()
    }
    
    struct cards: View{
        @Binding var cardCount: Int
        @Binding var theme: Color
        @Binding var emojis: [String]
        var body: some View{
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))])
            {
                ForEach(0..<cardCount, id: \.self){ index in
                    CardView(content: emojis[index])
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .foregroundStyle(theme)
        }
    }
    
    struct themeSelector: View{
        @Binding var emojis: [String]
        @Binding var theme: Color
        var body: some View{
            HStack{
                Spacer()
                VStack {
                    Button(action: {
                        emojis = ["🏎️","⛵️","🚠","✈️","🏎️","⛵️","🚠","✈️"]
                        emojis = emojis.shuffled()
                        theme = .green
                    },
                           label: {Image(systemName: "cablecar.fill")
                    })
                    .font(.title)
                    Text("Transportation")
                        .foregroundStyle(.blue)
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        emojis = ["🤽‍♀️","🏄‍♂️","🚴‍♂️","⛹️","🤽‍♀️","🏄‍♂️","🚴‍♂️","⛹️"]
                        emojis = emojis.shuffled()
                        theme = .yellow
                    },
                           label: {
                        Image(systemName: "medal.fill")
                    })
                    .font(.title)
                    Text("Sports")
                        .foregroundStyle(.blue)
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        emojis = ["☃️","🎄","🎁","❄️","☃️","🎄","🎁","❄️"]
                        emojis = emojis.shuffled()
                        theme = .red
                    },
                           label: {
                        Image(systemName: "snow")
                    })
                    .font(.title)
                    Text("Winter")
                        .foregroundStyle(.blue)
                }
                Spacer()
            }
            .padding()
        }
    }
    
    struct CardView: View{
        var content: String
        @State var isFaceUp: Bool = false
        
        var body: some View{
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                base.fill().opacity(isFaceUp ? 0 : 1)
                
            }
            .onTapGesture {
                isFaceUp = !isFaceUp
            }
        }
    }
}

#Preview {
    ContentView()
}
