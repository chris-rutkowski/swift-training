//
//  Extensions.swift
//  Slot Machine
//
//  Created by Chris on 06/11/2021.
//

import SwiftUI

extension Text {
    func applyScoreLabelStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
    
    func applyScoreValueStyle() -> Text {
        self
            .foregroundColor(.white)
            .font(.system(.title, design: .rounded))
            .fontWeight(.heavy)
    }
}
