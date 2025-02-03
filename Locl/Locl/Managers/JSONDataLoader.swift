//
//  JSONDataLoader.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/3/25.
//

import Foundation

final class JSONDataLoader {
    func load<T: Decodable>(_ filename: String, as type: T.Type) throws -> T {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            throw AppError.fileNotFound
        }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
    
  
}
