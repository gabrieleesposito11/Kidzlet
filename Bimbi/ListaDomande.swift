//
//  ListaDomande.swift
//  Bimbi
//
//  Created by Giorgio Caiazzo on 20/02/24.
//

import Foundation
import Observation

@Observable class ListaDomande{
    var question : [Question] = [
        Question(text: "9 times 3 is", answer: [
            Answer(text: "81"),
            Answer(text: "27", isCorrect: true),
            Answer(text: "45"),
            Answer(text: "12")
        ])
    ]
    
    var rispostaCorrente = Answer(text: ".", isCorrect: false)
}
