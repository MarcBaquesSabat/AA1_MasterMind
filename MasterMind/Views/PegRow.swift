//
//  PegRow.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct PegRow: View {
    
    var body: some View {
        HStack{
            PegHoleView()
            PegHoleView()
            PegHoleView()
            PegHoleView()
            AnswerPegGrid()
        }
    }
}

struct PegRow_Previews: PreviewProvider {
    static var previews: some View {
        PegRow()
    }
}
