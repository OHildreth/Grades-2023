//
//  GradesViewModel.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/24/23.
//

import Foundation

class GradesViewModel: ObservableObject {
    var courseResults = CourseResults(withTestData: true)
    
    @Published var url: URL?
    
    @Published var students: [Student] = []
    
    @Published var sortOrder: [KeyPathComparator<Student>] = [
        .init(\.name, order: .forward)] {
            didSet {
                updateState()
            }
        }
    
    
    init() {
        setNotifications()
        updateState()
    }
    
    // MARK: - Update State
    private func updateState() {
        self.students = Array(courseResults.students.values).sorted(using: sortOrder)
    }
    
    
}

extension GradesViewModel {
    private func setNotifications() {
        NotificationCenter.default.addObserver(forName: .StudentsDidChange,
                                               object: nil,
                                               queue: nil,
                                               using: studentsDidChangeResponse(_:))
    }
    
    private func studentsDidChangeResponse(_ notification: Notification) {
        updateState()
    }
}
