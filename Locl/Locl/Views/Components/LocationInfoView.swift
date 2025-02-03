//
//  SwiftUIView.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/3/25.
//

import SwiftUI
import SwiftData
import MapKit

struct LocationInfoView: View {
    var mapSelection: ModelPlacemark?
    @State private var name = ""
    @State private var address = ""
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    let mapSelection = 
    LocationInfoView()
}
