//
//  ViewController.swift
//  JeuPendu
//
//  Created by Javen Vernet on 2023-09-21.
//

import UIKit

class ViewController: UIViewController {
    var falseTitle = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        let mv = MovieDownloader()
        mv.fetchMovieTitle{ titre in
            if let falseTitle = titre {
                print("Received title: \(falseTitle)")
                var characters = Array(falseTitle)
                for index in 0..<characters.count {
                    if characters[index] != " " {
                        characters[index] = "_"
                    }
                }
                print(characters)
            } else {
                // Handle the error or title not found case
                print("Error or title not found.")
            }
        }
    }
    
    
}

