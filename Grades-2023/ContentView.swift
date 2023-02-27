//
//  ContentView.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 2/22/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gradesViewModel = GradesViewModel()
    
    var body: some View {
        VStack {
            Text("Drop Files View")
            Divider()
            HSplitView {
                StudentTableView(students: gradesViewModel.students, sortOrder: $gradesViewModel.sortOrder)
                    .frame(minHeight: 200.0)
                Text("List with TextFields").frame(minWidth: 100, maxWidth: .infinity)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
