//
//  Student.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/22/23.
//

import Foundation

class Student: Identifiable {
    let id = Student.ID()
    let studentID: String
    var name: String
    var overallScore = 0.0
    
    
     var letterGrade: LetterGrade {
         get {LetterGrade(withScore: overallScore)}
     }
     
    
    init(name: String, studentID: String) {
        self.name = name
        self.studentID = studentID
    }
    
    convenience init(name: String, studentID: String, overallScore: Double) {
        self.init(name: name, studentID: studentID)
        self.overallScore = overallScore
    }
    
    struct ID: Hashable {
        let id = UUID()
    }
}
