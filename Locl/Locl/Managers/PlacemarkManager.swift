//
//  PlacemarkManager.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/2/25.
//

import Foundation

class PlacemarkManager: ObservableObject {
    static let shared = PlacemarkManager()  // Singleton instance - ensures that only one instance of placemarks is shared throughout the app
    var placemarks: [ModelPlacemark] = []
    
    private init() {}  // Prevent initialization from outside
    private let dataLoader = JSONDataLoader()

    func loadPlacemarks() {
        do {
            let jsonPlacemarks: [JSONPlacemark] = try dataLoader.load("placemarks", as: [JSONPlacemark].self)
            self.placemarks = jsonPlacemarks.map { json in
                ModelPlacemark(
                    name: json.name,
                    latitude: json.latitude,
                    longitude: json.longitude,
                    address: nil // Set later
                ) }
        } catch {
            print("Error: \(error)")
        }
    }
}
