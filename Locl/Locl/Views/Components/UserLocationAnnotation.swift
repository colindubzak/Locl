//
//  UserLocationAnnotation.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/3/25.
//
import SwiftUI

struct UserLocationAnnotation: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 32, height: 32)
                .foregroundColor(.blue.opacity(0.25))
            Circle()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
            Circle()
                .frame(width: 12, height: 12)
                .foregroundColor(.blue)
        }
    }
}
