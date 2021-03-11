//
//  ContentView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import SwiftUI
import Foundation


struct ContentView: View {
    
    @ObservedObject var viewModel:ViewModel
    
    var body: some View {
        VStack {
            Text("MasterMind").font(.title).padding().background(Color.orange)
            VStack{
                ForEach(viewModel.$codeGuesses, id: \.self) { code in
                    PegRow(2)
                }

                
                PegRow(3)
                PegRow(4)
                PegRow(5)
                PegRow(6)
                PegRow(7)
                PegRow(8)
                PegRow(9)
                PegRow(10)
            }
            HStack{
                Text("Turn: " + "\(viewModel.$actualTurn)").font(.title2).background(Color.orange).padding()
                
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
