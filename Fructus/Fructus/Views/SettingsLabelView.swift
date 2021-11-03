//
//  SettingsLabelView.swift
//  Fructus
//
//  Created by Chris on 03/11/2021.
//

import SwiftUI

struct SettingsLabelView: View {
    @State var text: String
    @State var systemImage: String
    
    var body: some View {
        HStack {
            Text(text.uppercased())
                .fontWeight(.bold)
            Spacer()
            Image(systemName: systemImage)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(text: "Title", systemImage: "info.circle")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
