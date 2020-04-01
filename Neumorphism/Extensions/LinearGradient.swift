//
//  LinearGradient.swift
//  Neumorphism
//
//  Created by David Silva on 01/04/2020.
//  Copyright © 2020 David Silva. All rights reserved.
//

import SwiftUI

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(
            gradient: Gradient(colors: colors),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}
