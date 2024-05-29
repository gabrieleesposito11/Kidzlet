//
//  ViewModel.swift
//  Bimbi
//
//  Created by Giorgio Caiazzo on 20/02/24.
//

import Foundation

struct Answer : Identifiable{
    var id : UUID = UUID()
    var text : String
    var isCorrect : Bool = false
}

struct Question : Identifiable{
    var id : UUID = UUID()
    var text : String
    var answer : [Answer]
}
