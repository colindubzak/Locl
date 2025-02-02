//
//  PlacemarkManager.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/2/25.
//

import Foundation
class PlacemarkManager {
    static let shared = PlacemarkManager()  // Singleton instance
    
    var placemarks: [ModelPlacemark] = []
    
    private init() {}  // Prevent initialization from outside
    
    func loadPlacemarks() {
        if let url = Bundle.main.url(forResource: "placemarks", withExtension: "json") {
            print("JSON file found at: \(url)")
            if let data = try? Data(contentsOf: url) {
                do {
                    let decoder = JSONDecoder()
                    placemarks = try decoder.decode([ModelPlacemark].self, from: data)
                    print("Successfully decoded \(placemarks.count) placemarks.")
                    for placemark in placemarks {
                        print("Placemark: \(placemark.name), Latitude: \(placemark.latitude), Longitude: \(placemark.longitude)")
                    }
                } catch {
                    print("Failed to decode JSON: \(error)")
                }
            } else {
                print("Failed to load data from JSON file.")
            }
        } else {
            print("Could not find placemarks.json in the app bundle.")
        }
    }
}
