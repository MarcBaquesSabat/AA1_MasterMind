//
//  PegRow.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct PegRow: View {
    
    var colors:[Color]
    
    var body: some View {
        HStack{
            PegHoleView(colors[0])
            PegHoleView(colors[1])
            PegHoleView(colors[2])
            PegHoleView(colors[3])
            
        }
    }
    
    init(_ colors: CodeModel) {
        self.colors = colors.codeColors
    }
}

struct PegRow_Previews: PreviewProvider {
    static var previews: some View {
        PegRow(CodeModel())
    }
}
