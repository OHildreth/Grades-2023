//
//  AssignmentGroup.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/22/23.
//

import Foundation


class AssignmentGroup {
    let id = AssignmentGroup.ID()
    
    var name: String
    
    var weight: Double
    
    var assignments: [Assignment.ID : Assignment] = [:]
    
    init(name: String, weight: Double) {
        self.name = name
        self.weight = weight
    }
    
    struct ID: Hashable {
        let id = UUID()
    }
}
