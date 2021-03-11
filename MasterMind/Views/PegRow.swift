//
//  PegRow.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct PegRow: View {
    
    var rowIndex:Int = 0
    
    var body: some View {
        HStack{
            Text("\(rowIndex)")
            PegHoleView()
            PegHoleView()
            PegHoleView()
            PegHoleView()
            AnswerPegGrid()
        }
    }
    
    init(_ rowIndex:Int) {
        self.rowIndex = rowIndex
    }
}

struct PegRow_Previews: PreviewProvider {
    static var previews: some View {
        PegRow(0)
    }
}
