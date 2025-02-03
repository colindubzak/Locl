//
//  JSONPlacemark.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/3/25.
//

import Foundation
struct JSONPlacemark: Decodable {
    let name: String
    let latitude: Double
    let longitude: Double

    enum CodingKeys: String, CodingKey {
        case name
        case coordinates
    }

    enum CoordinatesKeys: String, CodingKey {
        case latitude
        case longitude
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        let coordinatesContainer = try container.nestedContainer(
            keyedBy: CoordinatesKeys.self,
            forKey: .coordinates
        )
        latitude = try coordinatesContainer.decode(Double.self, forKey: .latitude)
        longitude = try coordinatesContainer.decode(Double.self, forKey: .longitude)
    }
}
