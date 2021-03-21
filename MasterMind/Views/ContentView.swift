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
    let buttonChoseSize: CGFloat = 100
    
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
                .scaledToFill()
               
                HStack{

                    Text("Turn: " + "\(viewModel.actualTurn + 1)")
                        .font(.body)
                        .background(Color.orange)
                        .padding()
                    
                    Button("     ",action: {viewModel.SetColor(Color.red)})
                        .background(Color.red)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4)
                        )
                        .clipShape(Circle())
                        .frame(width: 35,height: 35)
                        
                    Button("     ",action: {viewModel.SetColor(Color.blue)})
                        .background(Color.blue)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4)
                        )
                        .clipShape(Circle())
                        .frame(width: 35,height: 35)
                    
                    Button("     ",action: {viewModel.SetColor(Color.green)})
                        .background(Color.green)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4)
                        )
                        .clipShape(Circle())
                        .frame(width: 35,height: 35)
                    
                    Button("        ",action: {viewModel.SetColor(Color.yellow)})
                        .background(Color.yellow)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 4)
                        )
                        .clipShape(Circle())
                        .frame(width: 35,height: 35)
                        
        
                    Button(action: viewModel.CheckGuess) {
                        Image(systemName: "play")
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    }
                }
                HStack{
                    Button(action: viewModel.Clear) {
                        Image(systemName: "trash.circle")
                            .background(Color.white)
                            .clipShape(Circle())
                    }
                    Button( "Restart",action: viewModel.Restart)
                        .padding(1)
                        .background(Color.white)
                        .padding(5)
                        .border(Color.white, width: 2)
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
                }.frame(width: UIScreen.main.bounds.width, height: 20)
                    
            
            }.background(
                Image("GameBG")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                )
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
