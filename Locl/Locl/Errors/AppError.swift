//
//  AppError.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/3/25.
//
import Foundation

enum AppError: Error, LocalizedError {
    case fileNotFound, decodingFailed
    
    var errorDescription: String? {
        switch self {
        case .fileNotFound: return "JSON file not found."
        case .decodingFailed: return "Failed to decode data."
        }
    }
}
