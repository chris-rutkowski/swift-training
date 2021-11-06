//
//  LogoView.swift
//  Slot Machine
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("gfx-slot-machine")
            .resizable()
            .scaledToFit()
            .frame(
                minWidth: 256,
                idealWidth: 300,
                maxWidth: 320,
                alignment: .center
            )
            .padding(.horizontal)
            .layoutPriority(1)
            .modifier(ShadowModifier())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
