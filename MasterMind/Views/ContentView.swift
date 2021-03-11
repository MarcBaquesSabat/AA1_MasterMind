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
                ForEach(viewModel.codeGuesses, id: \.self) { code in
                    PegRow(0)
                }
            }
            HStack{
                Text("Turn: " + "\(viewModel.actualTurn)").font(.title2).background(Color.orange).padding()
                
                Circle().fill(Color.black)
                Circle().fill(Color.black)
                Circle().fill(Color.black)
                Circle().fill(Color.black)
                Button("Check",action: viewModel.CheckGuess)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
