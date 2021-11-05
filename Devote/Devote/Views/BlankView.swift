//
//  BlankView.swift
//  Devote
//
//  Created by Chris on 04/11/2021.
//

import SwiftUI

struct BlankView: View {
    let backgroundColor: Color
    
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(backgroundColor)
        .blendMode(.overlay)
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        BlankView(backgroundColor: .black.opacity(0.3))
            .background(BackgroundImageView())
            .background(
                backgroundGradient.ignoresSafeArea()
            )
    }
}
