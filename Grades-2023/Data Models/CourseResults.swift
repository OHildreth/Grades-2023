//
//  CourseResults.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/24/23.
//

import Foundation

class CourseResults: ObservableObject {
    var students: [Student.ID : Student] = [:]
    
    var assignmentGroups: [AssignmentGroup.ID : AssignmentGroup] = [:]
}
