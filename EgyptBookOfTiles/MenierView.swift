//
//  MenierView.swift
//  EgyptBookOfTiles
//
//  Created by Nicolae Chivriga on 20/12/2024.
//

import SwiftUI
import StoreKit


struct MenierView: View {
    @Environment(\.requestReview) var stars
    var body: some View {
        ZStack {
            Image("bg")
            .resizable()
            .ignoresSafeArea()
            
            VStack {
                Image("logotips")
                    .resizable()
                    .scaledToFit()
                VStack(spacing: 22) {
                    NavigationLink {
                        GameView()
                    } label: {
                        Image("purpl")
                        
                            .overlay {
                                Text("PLAY")
                                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                                    .foregroundStyle(.white)
                            }
                    }
                    
                    
                    NavigationLink {
                        RulesView()
                    } label: {
                        Image("grin")
                        
                            .overlay {
                                Text("RULES")
                                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                                    .foregroundStyle(.white)
                            }
                    }
                    
                    
                    Button {
                        stars()
                    } label: {
                        Image("torq")
                        
                            .overlay {
                                Text("STARS")
                                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                                    .foregroundStyle(.white)
                            }
                    }
                }
                .padding(.top, 80)

                    
                

             Spacer()
            }
            .padding(.vertical)
        }
        .navigationBarBackButtonHidden()
    }
}
