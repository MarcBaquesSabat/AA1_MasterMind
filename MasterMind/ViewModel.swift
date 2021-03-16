//
//  ContentView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import Foundation
import SwiftUI

class ViewModel : ObservableObject{
    
    var secretCode : CodeModel = CodeModel()
    let configuration:Configuration = Configuration()
    
    @Published var codeGuesses: [CodeModel] = []
    @Published var codeAnswers:[CodeModel] = []
    @Published var actualTurn : Int = 1
    
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
            codeGuesses.append(codeModel)
        }
        for _ in 0..<configuration.codeGuesses {
            var codeModel = CodeModel()
            for _ in 0..<configuration.numColors {
                codeModel.codeColors.append(Color.black)
            }
            codeAnswers.append(codeModel)
        }
        
    }
    
    public func CheckGuess(){
        //Check all has value
            //If not dont check or pass turn
        //Else continue
        
        //Check answer, turn is over
        var codeReviewer = CodeReviewer()
        
        let result = codeReviewer.ReviewCode(codeGuesses[actualTurn], secretCode)
        
        if(result.positioned == 4){
            WinGame()
        }else{
            if(actualTurn >= 12){
                LoseGame()
                return
            }
            UpdateReview()
            actualTurn += 1
        }          
    }
    
    func UpdateReview(){
        //Actualiza la respuesta segun si es correcta o incorrecta
    }
    
    func WinGame(){
        print("Win")
    }
    
    func LoseGame(){
        print("Lose")
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
    }
    
}
