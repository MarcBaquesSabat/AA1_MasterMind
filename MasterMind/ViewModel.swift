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
        
    }
    
    func CheckGuess(){
        //Check answer, turn is over
        let codeReviewer = CodeReviewer()
        
    }
    
    func WinGame(){
        
    }
    
    func GenerateSecretColor(){
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
