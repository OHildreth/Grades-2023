//
//  CourseResults_Notifications.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/27/23.
//

import Foundation


// MARK: - Notifications
extension CourseResults {
    func sendStudentsDidChangeNotification() {
        NotificationCenter.default.post(name: .StudentsDidChange, object: self)
    }
}

extension Notification.Name {
    static let StudentsDidChange = Notification.Name("StudentsDidChange")
}
