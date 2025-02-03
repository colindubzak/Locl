//
//  PlacemarkManager.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/2/25.
//

import Foundation

// making this jawn an observable object will allow the placemarks to be updated as the
class PlacemarkManager: ObservableObject{
    static let shared = PlacemarkManager()
    @Published var placemarks: [ModelPlacemark] = [] // Now publishes changes

    private init() {}  // Prevent initialization from outside
    
    func loadPlacemarks() {
        DispatchQueue.global(qos: .background).async { // Load off the main thread
            if let url = Bundle.main.url(forResource: "placemarks", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let decodedPlacemarks = try decoder.decode([ModelPlacemark].self, from: data)
                    
                    DispatchQueue.main.async { // Update UI on main thread
                        self.placemarks = decodedPlacemarks
                        print("Loaded \(decodedPlacemarks.count) placemarks.")
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
}
