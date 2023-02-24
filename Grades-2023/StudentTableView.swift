//
//  StudentTableView.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/24/23.
//

import SwiftUI

struct StudentTableView: View {
    var students: [Student]
    
    var body: some View {
        Table(students) {
            TableColumn("Student Name", value: \.name)
            TableColumn("Student ID", value: \.studentID)
            TableColumn("Overall Score") {
                Text(String($0.overallScore))
            }
            
        }
    }
}



 struct StudentTableView_Previews: PreviewProvider {
     static var previews: some View {
         StudentTableView(students: [])
     }
 }
 

