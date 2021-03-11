//
//  ContentView.swift
//  MasterMind
//
//  Created by Alumne on 9/3/21.
//

import Foundation
import SwiftUI

class ViewModel {
    
    let secretCode : CodeModel = CodeModel()
    let configuration:Configuration = Configuration()
    var codeGuesses: [CodeModel] = []
    var codeAnswers:[CodeModel] = []
    var actualTurn : Int = 1
    
    func SetupGame(){
        
        for <#item#> in <#items#> {
            <#code#>
        }
        
    }
    
    func CheckGuess(){
        
    }
    
    func WinGame(){
        
    }
    
    func GenerateSecretColor(){
        
    }
    
}
