//
//  GeometryProxy+.swift
//  SwimPal
//
//  Created by Bruno Benčević on 15.07.2022..
//

import SwiftUI

extension GeometryProxy {
    
    var width: CGFloat {
        self.size.width
    }
    
    var height: CGFloat {
        self.size.height
    }
    
    var midY: CGFloat {
        self.frame(in: .global).midY
    }
}
