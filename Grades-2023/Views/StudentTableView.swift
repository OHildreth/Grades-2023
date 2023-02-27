//
//  StudentTableView.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/24/23.
//

import SwiftUI

struct StudentTableView: View {
    var students: [Student]
    
    @Binding var sortOrder: [KeyPathComparator<Student>]
    
    var body: some View {
        Table(students, sortOrder: $sortOrder) {
            TableColumn("Student Name", value: \.name)
            TableColumn("Student ID", value: \.studentID)
            TableColumn("Overall Score", value: \.overallScore) {
                Text(String(format: "%.2f", $0.overallScore))
            }
            TableColumn("Letter Grade") {
                Text($0.letterGrade.rawValue)
            }
            
        }
    }
}


/*
 struct StudentTableView_Previews: PreviewProvider {
     static var previews: some View {
         StudentTableView(students: [])
     }
 }
 */

 

