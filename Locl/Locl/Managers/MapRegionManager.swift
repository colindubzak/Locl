//
//  MapRegionManager.swift
//  Locl
//
//  Created by Joshua Hodgson on 2/3/25.
// Placing this shit here so it's a lil easier when we add current location n shit
// can also add different regions to eaisly test out other places

import MapKit

final class MapRegionManager {
    static let defaultRegion: MKCoordinateRegion = {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 33.0046, longitude: -96.7081),
            span: MKCoordinateSpan(latitudeDelta: 0.085, longitudeDelta: 0.085)
        )
    }()
    
    static let dickballRegion: MKCoordinateRegion = {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 69.0046, longitude: -69.7081),
            span: MKCoordinateSpan(latitudeDelta: 0.085, longitudeDelta: 0.085)
        )
    }()
}
