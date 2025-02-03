//
//  ModelPlacemark.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/2/25.
//

import MapKit
import SwiftData

@Model
class ModelPlacemark {
    var name: String
    var latitude: Double
    var longitude: Double
    var address: String?

    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }


    init(name: String, latitude: Double, longitude: Double, address: String?) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
    }
}
