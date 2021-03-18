//
//  ContentView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import Foundation
import SwiftUI

enum GameState{
    case START
    case GAME
    case WIN
    case LOSE
}

class ViewModel : ObservableObject{
    
    var secretCode : CodeModel = CodeModel()
    let configuration:Configuration = Configuration()
    var actualPegPainting = 0
    
    @Published var totalCodes : (codeGuesses: [CodeModel], codeAnswers: [CodeModel]) = ([],[])
    @Published var actualTurn : Int = 0
    @Published var indexs:[Int] = [0,1,2,3,4,5,6,7,8,9,10,11]
    @Published var gameState = GameState.START
    
    init() {
        SetupGame()
    }
    
    func SetupGame(){
        GenerateSecretColor()
        
        for _ in 0..<configuration.codeGuesses {
            
            var codeModel = CodeModel()
            for _ in 0..<configuration.numColors {
                codeModel.codeColors.append(Color.black)
            }
            totalCodes.codeGuesses.append(codeModel)
            
            var codeModel2 = CodeModel()
            for _ in 0..<configuration.numColors {
                codeModel2.codeColors.append(Color.black)
            }
            totalCodes.codeAnswers.append(codeModel2)
        }
        
    }
    
    public func CheckGuess(){
        print("Check guess")
        
        for peg in totalCodes.codeGuesses[actualTurn].codeColors {
            if peg == .black{
                print("Not all have value!")
                return
            }
        }
  
        let codeReviewer = CodeReviewer()
        
        let result = codeReviewer.ReviewCode(totalCodes.codeGuesses[actualTurn], secretCode)
        
        print(result)
        var tempIndex = 0
        for _ in 0..<result.positioned {
            totalCodes.codeAnswers[actualTurn].codeColors[tempIndex] = .white
            tempIndex += 1
        }
        for _ in 0..<result.missPositioned {
            totalCodes.codeAnswers[actualTurn].codeColors[tempIndex] = .red
        }
        
        if(result.positioned == 4){
            WinGame()
        }else{
            if(actualTurn >= 11){
                LoseGame()
                return
            }
            
            actualTurn += 1
            actualPegPainting = 0
        }          
    }
    
    func SetColor(_ colorChoosen: Color){
        if(actualPegPainting < 4){
            totalCodes.codeGuesses[actualTurn].codeColors[actualPegPainting] = colorChoosen
            actualPegPainting += 1
        }
    }
    
    func Clear(){
        for i in 0..<configuration.numColors {
            totalCodes.codeGuesses[actualTurn].codeColors[i] = .black
        }
        actualPegPainting = 0
    }
    
    func Restart(){
        //Reset State
        actualTurn = 0
        actualPegPainting = 0
        
        //Clean GuessCodes
        for codeGuessIndex in 0..<configuration.codeGuesses {
            for codeColorIndex in 0..<configuration.numColors {
                totalCodes.codeGuesses[codeGuessIndex].codeColors[codeColorIndex] = .black
            }
        }
        //Clean Answers
        for codeGuessIndex in 0..<configuration.codeGuesses {
            for codeColorIndex in 0..<configuration.numColors {
                totalCodes.codeAnswers[codeGuessIndex].codeColors[codeColorIndex] = .black
            }
        }
        //Generate new state
        GenerateSecretColor()
        gameState = .GAME
        print("Restart")
    }
    
    func WinGame(){
        print("Win")
        gameState = .WIN
    }
    
    func LoseGame(){
        print("Lose")
        gameState = .LOSE
    }
    
    func Start(){
        gameState = .GAME
    }
    
    func GenerateSecretColor(){
        secretCode = CodeModel()
        for _ in 0..<configuration.numColors {
            secretCode.codeColors.append(Color.black)
        }
        
        for i in 0..<4 {
            let colorChoosen = Int.random(in: 0..<configuration.numColors)
            switch colorChoosen {
            case 0:
                secretCode.codeColors[i] = .red
            case 1:
                secretCode.codeColors[i] = .blue
            case 2:
                secretCode.codeColors[i] = .green
            case 3:
                secretCode.codeColors[i] = .yellow
            default:
                return
            }
        }
        for i in 0..<4{
            print(secretCode.codeColors[i])
        }
        
    }
    
}
