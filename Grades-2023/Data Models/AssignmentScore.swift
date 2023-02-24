//
//  AssignmentScore.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/22/23.
//

import Foundation

struct AssignmentScore {
    let id = AssignmentScore.ID()
    
    let studentID: Student.ID
    
    let assignmentID: Assignment.ID
    
    var score: Double?
    
    
    struct ID: Hashable {
        let id = UUID()
    }
}


