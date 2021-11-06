//
//  ContentView.swift
//  Slot Machine
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct ContentView: View {
    //    private let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    private let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin"]
    
    @State private var reels = [1, 1, 1]
    @State private var isInfoViewDisplayed = false
    @State private var coins = 100
    @AppStorage("highscore") private var highscore = 0
    @State private var bet = 10
    @State private var isShowingGameOverModal = false
    @State private var animatingReels = false
    @State private var animatingModal = false

    private func spin() {
        coins -= bet
        
        //        reels[0] = Int.random(in: 0..<symbols.count)
        //        reels[1] = Int.random(in: 0..<symbols.count)
        //        reels[2] = Int.random(in: 0..<symbols.count)
        reels = reels.map { _ in
            Int.random(in: 0..<symbols.count)
        }
    }
    
    private func checkResult() {
        if reels[0] == reels[1] && reels[1] == reels[2] {
            handleWin()
            
            if coins > highscore {
                updateHighscore()
            }
        } else {
            handleLoss()
        }
    }
    
    private func handleWin() {
        coins += bet * 10
    }
    
    private func handleLoss() {
        if coins <= 0 {
            isShowingGameOverModal = true
        }
    }
    
    private func updateHighscore() {
        highscore = coins
    }
    
    private func setBet(_ bet: Int) {
        withAnimation {
            self.bet = bet
        }
    }
    
    private func resetGame() {
        highscore = 0
        coins = 100
        setBet(10)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(
                    colors: [Color("ColorPink"), Color("ColorPurple")]
                ),
                startPoint: .top,
                endPoint: .bottom
            )
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 5) {
                LogoView()
                Spacer()
                
                HStack {
                    HStack {
                        Text("Your\ncoins".uppercased())
                            .applyScoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("\(coins)")
                            .applyScoreValueStyle()
                            .modifier(ScoreValueModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highscore)")
                            .applyScoreValueStyle()
                            .modifier(ScoreValueModifier())
                        
                        Text("High\nscore".uppercased())
                            .applyScoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                VStack(alignment: .center, spacing: 0) {
                    ZStack {
                        ReelView()
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                            .opacity(animatingReels ? 1 : 0)
                            .offset(y: animatingReels ? 0 : -50)
                            .animation(
                                .easeOut(duration: .random(in: 0.5...0.7))
                            )
                            .onAppear {
                                animatingReels.toggle()
                            }
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        ZStack {
                            ReelView()
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingReels ? 1 : 0)
                                .offset(y: animatingReels ? 0 : -50)
                                .animation(
                                    .easeOut(duration: .random(in: 0.7...0.9))
                                )
                                .onAppear {
                                    animatingReels.toggle()
                                }
                        }
                        
                        Spacer()
                        
                        ZStack {
                            ReelView()
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingReels ? 1 : 0)
                                .offset(y: animatingReels ? 0 : -50)
                                .animation(
                                    .easeOut(duration: .random(in: 0.9...1.1))
                                )
                                .onAppear {
                                    animatingReels.toggle()
                                }
                        }
                    }
                    .frame(maxWidth: 500)
                    
                    Button(action: {
                        withAnimation {
                            animatingReels = false
                        }
                        
                        spin()
                        
                        withAnimation {
                            animatingReels = true
                        }
                        
                        checkResult()
                    }) {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }
                }
                .layoutPriority(2)
                
                Spacer()
                
                HStack {
                    HStack(alignment: .center, spacing: 10) {
                        Button(action: {
                            setBet(20)
                        }) {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(bet == 20 ? Color("ColorYellow") : .white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .offset(x: bet == 20 ? 0 : 16)
                            .opacity(bet == 20 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                        // TODO: animation .default
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(bet == 10 ? 1 : 0)
                            .offset(x: bet == 10 ? 0.0 : -16.0)
                            .modifier(CasinoChipsModifier())
                        // TODO: animation .default
                        
                        Button(action: {
                            setBet(10)
                        }) {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(bet == 10 ? Color("ColorYellow") : .white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                    }
                }
            }
            .overlay(
                Button(action: {
                    resetGame()
                }) {
                    Image(systemName: "arrow.2.circlepath.circle")
                }
                    .modifier(ButtonModifier())
                ,
                alignment: .topLeading
            )
            .overlay(
                Button(action: {
                    isInfoViewDisplayed.toggle()
                }) {
                    Image(systemName: "info.circle")
                }
                    .modifier(ButtonModifier())
                ,
                alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $isShowingGameOverModal.wrappedValue ? 5 : 0, opaque: false)
            
            if $isShowingGameOverModal.wrappedValue {
                ZStack {
                    Color("ColorTransparentBlack")
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack(spacing: 0) {
                        Text("Game over".uppercased())
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(Color("ColorPink"))
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        VStack(alignment: .center, spacing: 16) {
                            Image("gfx-seven-reel")
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            
                            Text("Bad luck! You've lost all of the coins.\nLet's play again!")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.gray)
                                .layoutPriority(1)
                            
                            Button(action: {
                                isShowingGameOverModal = false
                                coins = 100
                                animatingModal = false
                            }) {
                                Text("New game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .accentColor(Color("ColorPink"))
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundColor(Color("ColorPink"))
                                    )
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: Color("ColorTransparentBlack"), radius: 6, x: 0, y: 8)
                    .opacity($animatingModal.wrappedValue ? 1 : 0)
                    .offset(y: $animatingModal.wrappedValue ? 0 : -100)
                    .animation(Animation.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0))
                    .onAppear {
                        withAnimation {
                            animatingModal = true
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isInfoViewDisplayed) {
            InfoView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
