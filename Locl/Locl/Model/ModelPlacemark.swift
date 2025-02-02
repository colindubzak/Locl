//
//  ModelPlacemark.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/2/25.
//

import MapKit
import SwiftData

@Model
class ModelPlacemark: Decodable {
    var name: String
    var latitude: Double
    var longitude: Double
    var address: String?

    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }

    enum CodingKeys: String, CodingKey {
        case name
        case coordinates
    }

    enum CoordinatesCodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)

        // Decode nested coordinates
        let coordinatesContainer = try container.nestedContainer(keyedBy: CoordinatesCodingKeys.self, forKey: .coordinates)
        latitude = try coordinatesContainer.decode(Double.self, forKey: .latitude)
        longitude = try coordinatesContainer.decode(Double.self, forKey: .longitude)
    }

    init(name: String, latitude: Double, longitude: Double, address: String) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.address = address
    }
}
