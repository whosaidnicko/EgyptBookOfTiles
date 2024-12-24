//
//  GameView.swift
//  EgyptBookOfTiles
//
//  Created by Nicolae Chivriga on 20/12/2024.
//

import SwiftUI


struct GameView: View {
    @State var degrees: Double = 0
    
    var body: some View {
        ZStack {
            Image("bg")
                .resizable()
                .ignoresSafeArea()
            
            Circle()
                .trim(from: 0, to: 0.8)
                .fill(Color.white)
                .frame(width: 60, height: 60)
                .rotationEffect(.degrees(degrees))
            WKWebViewRepresentable(url: URL(string: "https://tilesofegypt.h5games.usercontent.goog/v/dd964fa3-8999-4546-a4a0-d55a0cc72248/")!, onLoadCompletion: {
                withAnimation {
                    
                } completion: {
                    
                }
                
            })
        }
        .navigationBarItems(leading: Bo())
        .navigationBarBackButtonHidden()
        .onAppear() {
            withAnimation(Animation.linear(duration: 60)) {
                degrees = 6000
            }
        }
    }
}
