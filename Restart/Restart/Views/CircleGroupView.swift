//
//  CircleGroupView.swift
//  Restart
//
//  Created by Chris on 02/11/2021.
//

import SwiftUI

struct CircleGroupView: View {
    @State var color: Color
    @State private var isAnimating = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(color, lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(color, lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        }
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            CircleGroupView(color: .white.opacity(0.2))
        }
    }
}
