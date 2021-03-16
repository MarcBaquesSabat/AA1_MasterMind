//
//  CodeReviewer.swift
//  MasterMind
//
//  Created by Alumne on 11/3/21.
//

import Foundation
import SwiftUI

public class CodeReviewer{
    
    func ReviewCode(_ guess:[Color], _ secretCode:[Color]) -> (positioned : Int, missPositioned : Int){
        var matches = 0
        var missplace = 0
        
        var guessDict : [Color:Int] = [:]
        var secretDict : [Color:Int] = [:]
        for (index,color) in guess.enumerated() {

            if(guess[index] == secretCode[index]){
                matches += 1
            }
            else
            {
                if(guessDict[guess[index]] == nil){
                    guessDict[guess[index]] = 1
                }
                else
                {
                    guessDict[guess[index]]! += 1
                }

                if(secretDict[secretCode[index]] == nil){
                    secretDict[secretCode[index]] = 1
                }
                else
                {
                    secretDict[secretCode[index]]! += 1
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
