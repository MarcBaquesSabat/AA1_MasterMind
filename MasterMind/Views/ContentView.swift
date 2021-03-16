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
                    PegRow()
                }
            }
            HStack{
                Text("Turn: " + "\(viewModel.actualTurn)")
                    .font(.body)
                    .background(Color.orange)
                    .padding()
                
                Button("     ",action: viewModel.SetColor).background(Color.red).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 35,height: 35)
                Button("     ",action: viewModel.SetColor).background(Color.blue).clipShape(Circle())
                    .frame(width: 35,height: 35)
                Button("     ",action: viewModel.SetColor).background(Color.green).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 35,height: 35)
                Button("     ",action: viewModel.SetColor).background(Color.yellow).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 35,height: 35)
    
                Button("Check",action: viewModel.CheckGuess)
            }
            HStack{
                Button("Clear", action: viewModel.CheckGuess)
                Button("Restart", action: viewModel.CheckGuess)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
