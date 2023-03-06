//
//  DropFileView.swift
//  Grades-2023
//
//  Created by Owen Hildreth on 3/6/23.
//

import SwiftUI

struct DropFileView: View {
    @Binding var url: URL?
    
    @State var isHoveredOver = false
    
    var body: some View {
    let dropDelegate = CSVURLDropDelegate(url: $url, isHoveredOver: $isHoveredOver)
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(.gray, lineWidth: 2)
            Text(fileName())
        }.onDrop(of: [.url], delegate: dropDelegate)
    }
    
    func fileName() -> String {
        if let unwrappedURL = url {
            let fileName = unwrappedURL.lastPathComponent
            return fileName
        } else {
            return "Drop File"
        }
    }
}

// MARK: - Drop Delegate
struct CSVURLDropDelegate: DropDelegate {
    @Binding var url: URL?
    @Binding var isHoveredOver: Bool

    func validateDrop(info: DropInfo) -> Bool {
        let state = info.hasItemsConforming(to: [.fileURL])
        
        return state
    }
    
    func dropEntered(info: DropInfo) {
        
        if info.hasItemsConforming(to: [.fileURL]) {
            isHoveredOver = true
        }
    
    }
    
    func dropExited(info: DropInfo) {
        isHoveredOver = false
    }
    
    func performDrop(info: DropInfo) -> Bool {
        
        Task {
            let localURL = await urlFrom(info)
            self.url = localURL
            
            isHoveredOver = false
        }
        
        return true
    }
    
    func urlFrom(_ info: DropInfo) async -> URL? {
        guard let item = info.itemProviders(for: [.fileURL]).first else { return nil }
        
        return await withCheckedContinuation { continuation in
            item.loadItem(forTypeIdentifier: "public.file-url", options: nil) { (urlData, error) in
                if let localURLData = urlData as? Data {
                    let localURL = URL(dataRepresentation: localURLData, relativeTo: nil)
                    
                    if localURL?.pathExtension != "csv" {
                        continuation.resume(returning: nil)
                    } else {
                        continuation.resume(returning: localURL)
                    }
                } else {continuation.resume(returning: nil)}
            }
        }
    }
}



struct DropFileView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "")
        DropFileView(url: .constant(url))
    }
}

