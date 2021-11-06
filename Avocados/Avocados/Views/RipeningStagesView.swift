//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Chris on 05/11/2021.
//

import SwiftUI

struct RipeningStagesView: View {
    let models = ripeningData
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Spacer()
            VStack {
                HStack(alignment: .center, spacing: 25) {
                    ForEach(models) { item in
                        RipeningView(model: item)
                    }
                }
            }
            .padding(.vertical)
            .padding(.horizontal, 25)
            
            Spacer()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct RipeningStagesView_Previews: PreviewProvider {
    static var previews: some View {
        RipeningStagesView()
    }
}
