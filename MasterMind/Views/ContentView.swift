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
            VStack(alignment: .center, spacing: 1.0) {
                
                VStack(alignment: .center){
                    ForEach(viewModel.indexs, id: \.self) { code in
                        HStack{
                            PegRow(viewModel.totalCodes.codeGuesses[code])
                            AnswerGrid(viewModel.totalCodes.codeAnswers[code].codeColors)
                        }
                    }
                }
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
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
                    Button(action: viewModel.Clear) {
                        Image(systemName: "trash")
                    }
                    Button("Restart", action: viewModel.Restart)
                }.frame(width: UIScreen.main.bounds.width, height: 20)
            }
            .padding(.bottom)
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            
        }else if(viewModel.gameState == GameState.START){
            StartView(viewModel: viewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}
