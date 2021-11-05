//
//  CardView.swift
//  Learn by Doing
//
//  Created by Chris on 05/11/2021.
//

import SwiftUI

struct CardView: View {
    let model: CardModel
    
    @State private var fadeIn = false
    @State private var moveTextDownward = false
    @State private var moveButtonUpward = false
    @State private var showAlert = false
    
    private let hapticImpact = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        ZStack {
            Image(model.imageName)
                .opacity(fadeIn ? 1 : 0)
            
            VStack {
                Text(model.title)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text(model.headline)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .italic()
            }
            .offset(y: moveTextDownward ? -218 : -300)
            
            Button(action: {
                playSound(sound: "sound-chime", type: "mp3")
                hapticImpact.impactOccurred()
                showAlert.toggle()
            }) {
                HStack {
                    Text(model.callToAction.uppercased())
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .accentColor(.white)
                    
                    Image(systemName: "arrow.right.circle")
                        .font(.title.weight(.medium))
                        .accentColor(.white)
                }
                .padding(.vertical)
                .padding(.horizontal, 24)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: model.gradientColors),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .clipShape(Capsule())
                .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
            }
            .offset(y: moveButtonUpward ? 210 : 300)
        }
        .frame(width: 335, height: 545)
        .background(
            LinearGradient(
                gradient: Gradient(colors: model.gradientColors),
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .cornerRadius(16)
        .shadow(radius: 8)
        .onAppear {
            withAnimation(.linear(duration: 1.2)) {
                fadeIn.toggle()
            }
            
            withAnimation(.linear(duration: 0.8)) {
                moveTextDownward.toggle()
                moveButtonUpward.toggle()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text(model.title),
                message: Text(model.message),
                dismissButton: .default(Text("Ok"))
            )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(model: cardsData[1])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
