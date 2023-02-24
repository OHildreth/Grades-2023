//
//  GradesViewModel.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/24/23.
//

import Foundation

class GradesViewModel: ObservableObject {
    var courseResults = CourseResults(withTestData: true)
    
    var students: [Student] = []
    
    // MARK: - Update State
    private func updateState() {
        self.students = Array(courseResults.students.values)
    }
    
    
}
