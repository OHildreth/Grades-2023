//
//  StudentsListView.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 3/1/23.
//

import SwiftUI

struct StudentsListView: View {
    @Binding var students: [Student]
    
    var body: some View {
    
        List {
            HStack {
                Text("Name")
                Spacer()
                Text("ID")
                Spacer()
                Text("Score")
            }
            ForEach($students) {$nextStudent in
                HStack {
                    TextField("Name: ", text: $nextStudent.name)
                        .textFieldStyle(.squareBorder)
                    Spacer()
                    Text(nextStudent.studentID)
                    Spacer()
                    TextField("Score: ", value: $nextStudent.overallScore, format: .number)
                        .textFieldStyle(.squareBorder)
                }
            }
            Text("Bund of Stuff")
        }
    }
}

/*
 struct StudentsListView_Previews: PreviewProvider {
     static var previews: some View {
         StudentsListView()
     }
 }
 */

