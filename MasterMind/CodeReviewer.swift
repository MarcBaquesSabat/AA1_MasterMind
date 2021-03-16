//
//  CodeReviewer.swift
//  MasterMind
//
//  Created by Alumne on 11/3/21.
//

import Foundation
import SwiftUI

public class CodeReviewer{
    
    func ReviewCode(_ guess:CodeModel, _ secretCode:CodeModel) -> (positioned : Int, missPositioned : Int){
        var matches = 0
        var missplace = 0
        
        var guessDict : [Color:Int] = [:]
        var secretDict : [Color:Int] = [:]
        for (index,color) in guess.codeColors.enumerated() {

            if(guess.codeColors[index] == secretCode.codeColors[index]){
                matches += 1
            }
            else
            {
                if(guessDict[guess.codeColors[index]] == nil){
                    guessDict[guess.codeColors[index]] = 1
                }
                else
                {
                    guessDict[guess.codeColors[index]]! += 1
                }

                if(secretDict[secretCode.codeColors[index]] == nil){
                    secretDict[secretCode.codeColors[index]] = 1
                }
                else
                {
                    secretDict[secretCode.codeColors[index]]! += 1
                }
            }
        }
        for(key,value) in guessDict{
            if(secretDict[key] == nil){
                continue
            }
            
            if(guessDict[key]! > secretDict[key]!){
                missplace += secretDict[key]!
            }
            else
            {
                missplace += guessDict[key]!
            }
        }

        return (matches,missplace)
    }
    
}
