//
//  Assignment.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/22/23.
//

import Foundation

class Assignment {
    let id = Assignment.ID()
    
    let name: String
    var maxScore: Double
    
    let assignmentGroup: AssignmentGroup
    
    var scores : [AssignmentScore.ID : AssignmentScore] = [:]
    
    init(name: String, maxScore: Double, assignmentGroup: AssignmentGroup) {
        self.name = name
        self.maxScore = maxScore
        self.assignmentGroup = assignmentGroup
    }
    
    struct ID: Hashable, Identifiable {
        let id = UUID()
    }
}

