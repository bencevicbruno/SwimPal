//
//  SheetNotch.swift
//  SwimPal
//
//  Created by Bruno Benčević on 21.06.2022..
//

import SwiftUI

struct SheetNotch: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
            
            VStack {
                Spacer()
                
                Rectangle()
                    .fill(Color.white)
            }
            
            Capsule()
                .fill(Color.gray142)
                .frame(width: 60, height: 5)
                .padding(.top, 10)
        }
        .frame(height: 25)
        .frame(maxWidth: .infinity)
        .contentShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct SheetNotch_Previews: PreviewProvider {
    static var previews: some View {
        SheetNotch()
    }
}
