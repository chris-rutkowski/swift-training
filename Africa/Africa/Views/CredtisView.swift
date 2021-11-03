//
//  CredtisView.swift
//  Africa
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct CredtisView: View {
    var body: some View {
        VStack {
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            Text("""
    Copyright Robert Petras
    All Rights Reserved
    Better Apps Less code
    """)
                .font(.footnote)
            .multilineTextAlignment(.center)
        }
        .padding()
        .opacity(0.4)
    }
}

struct CredtisView_Previews: PreviewProvider {
    static var previews: some View {
        CredtisView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
