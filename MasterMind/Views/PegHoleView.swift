//
//  PegHoleView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct PegHoleView: View {
    
    var color:Color = Color.black
    var height:CGFloat = 20.0
    var width:CGFloat = 20.0
    
    var body: some View {
        Circle().fill(color)
            .frame(width: self.width, height: self.height)
            .shadow(color: .black, radius:5)
    }
}

struct PegHoleView_Previews: PreviewProvider {
    static var previews: some View {
        PegHoleView()
    }
}

