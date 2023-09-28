//
//  JeuPendu.swift
//  JeuPendu
//
//  Created by Javen Vernet on 2023-09-21.
//

import Foundation

class JeuPendu {
    
    let maxErreurs : Int = 7;
    var erreurs : Int
    let titre : String
    var lettres : Array<Character>
    
    init(titre : String) {
        erreurs = 0
        self.titre = titre
        lettres = Array(self.titre)
    }
    
    func letterInWord(char: Character) -> Bool {
        return lettres.contains(char)
    }
    
    func gameIsOver() -> Bool {
        return erreurs >= maxErreurs
    }
}
