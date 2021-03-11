//
//  AnswerPegGrid.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct AnswerPegGrid: View {
    
    
    var body: some View {
        VStack{
            HStack{
                PegHoleView(color: .black, height: 8.0, width: 8.0)
                PegHoleView(color: .black, height: 8.0, width: 8.0)
            }
            HStack{
                PegHoleView(color: .black, height: 8.0, width: 8.0)
                PegHoleView(color: .black, height: 8.0, width: 8.0)
            }
        }
    }
    
}

struct AnswerPegGrid_Previews: PreviewProvider {
    static var previews: some View {
        AnswerPegGrid()
    }
}
