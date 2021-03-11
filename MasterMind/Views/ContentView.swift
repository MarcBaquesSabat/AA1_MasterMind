//
//  ContentView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI

struct row{
    let number :Int
    let content:String
}

struct ContentView: View {
    //Map of pegRows
    var pegRows:[PegRow] = [
        //PegRow()
    ]
    
    var body: some View {
        VStack {
            Text("MasterMind").font(.title).padding().background(Color.orange)
            VStack{
                PegRow(1)
                PegRow(2)
                PegRow(3)
                PegRow(4)
                PegRow(5)
                PegRow(6)
                PegRow(7)
                PegRow(8)
                PegRow(9)
                PegRow(10)
                //PegRow(11)
                //PegRow(12)
            }
            HStack{
                Text("Turn: ").font(.title2).background(Color.orange).padding()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
