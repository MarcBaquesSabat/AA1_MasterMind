//
//  PegHoleView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct PegHoleView: View {
    
    var color:Color = Color.white
    var height:CGFloat = 35.0
    var width:CGFloat = 35.0
    
    var body: some View {
        Circle().fill(color)
            .frame(width: self.width, height: self.height)
            .shadow(color: .black, radius:5)
    }
    
    init(_ color:Color) {
        self.color = color
    }
}

struct PegHoleView_Previews: PreviewProvider {
    static var previews: some View {
        PegHoleView(Color.white)
    }
}

