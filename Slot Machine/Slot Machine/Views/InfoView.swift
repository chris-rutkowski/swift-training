//
//  InfoView.swift
//  Slot Machine
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LogoView()
            
            Spacer()
            
            Form {
                Section(header: Text("About the application")) {
                    FormRowView(caption: "Application", value: "Slot Machine")
                    FormRowView(caption: "Platforms", value: "iPhone, iPad, Mac")
                    FormRowView(caption: "Developers", value: "John / Jane")
                    FormRowView(caption: "Designer", value: "Robert Petras")
                    FormRowView(caption: "Music", value: "Dan Lebowitz")
                    FormRowView(caption: "Website", value: "swiftuimasterclass.com")
                    FormRowView(caption: "Copyright", value: "© 2020 All rights reserved.")
                    FormRowView(caption: "Version", value: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
                .padding(.top, 30)
                .padding(.trailing, 30)
                .accentColor(.secondary)
            , alignment: .topTrailing
        )
    }
}

struct FormRowView: View {
    let caption: String
    let value: String
    
    var body: some View {
        HStack {
            Text(caption)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
