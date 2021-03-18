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
        
        if(viewModel.gameState == GameState.WIN){
            Text("You win!")
        }else if(viewModel.gameState == GameState.LOSE){
            Text("You lose!").font(.body)
                .background(Color.orange)
                .padding()
            Button("RESTART",action: { viewModel.Restart()})
        }else if(viewModel.gameState == GameState.GAME){
            VStack {
                VStack{
                    ForEach(viewModel.indexs, id: \.self) { code in
                        HStack{
                            PegRow(viewModel.totalCodes.codeGuesses[code])
                            AnswerGrid(viewModel.totalCodes.codeAnswers[code].codeColors)
                        }
                    }
                }
                HStack{

                    Text("Turn: " + "\(viewModel.actualTurn + 1)")
                        .font(.body)
                        .background(Color.orange)
                        .padding()
                    Button("     ",action: {viewModel.SetColor(Color.red)}).background(Color.red).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 35,height: 35)
                    Button("     ",action: {viewModel.SetColor(Color.blue)}).background(Color.blue).clipShape(Circle())
                        .frame(width: 35,height: 35)
                    Button("     ",action: {viewModel.SetColor(Color.green)}).background(Color.green).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 35,height: 35)
                    Button("     ",action: {viewModel.SetColor(Color.yellow)}).background(Color.yellow).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 35,height: 35)
        
                    Button("Check",action: viewModel.CheckGuess)
                }
                HStack{
                    Button("Clear", action: viewModel.Clear)
                    Button("Restart", action: viewModel.Restart)
                }
            }
        }else if(viewModel.gameState == GameState.START){
            VStack{
                Text("MasterMind").font(.title).padding().background(Color.orange)
                Button("START",action: { viewModel.Start()})
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
