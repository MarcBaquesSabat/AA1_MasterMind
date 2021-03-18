//
//  AnswerGrid.swift
//  MasterMind
//
//  Created by Alumne on 16/3/21.
//

import SwiftUI

struct AnswerGrid: View {
    
    var colors: [Color]
    
    var body: some View {
        VStack{
            HStack{
                Circle().fill(colors[0]).frame(width: 8, height: 8).border(Color.black)
                Circle().fill(colors[1]).frame(width: 8, height: 8).border(Color.black)
            }
            HStack{
                Circle().fill(colors[2]).frame(width: 8, height: 8).border(Color.black)
                Circle().fill(colors[3]).frame(width: 8, height: 8).border(Color.black)
            }
        }
        
    }
    
    init(_ colors:[Color]) {
        self.colors = colors
    }
}

struct AnswerGrid_Previews: PreviewProvider {
    static var previews: some View {
        AnswerGrid([.black,.black, .black, .black])
    }
}
