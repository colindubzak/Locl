
import SwiftUI
import MapKit

import SwiftUI
import MapKit

struct MapView: View {
    @State private var placeMarks: [ModelPlacemark] = []
    @State private var mapSelection: ModelPlacemark?
    
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 33.004637785071395, longitude: -96.70815862051346),
            span: MKCoordinateSpan(latitudeDelta: 0.085, longitudeDelta: 0.085)
        )
    }


    var body: some View {
        Map(initialPosition: .region(region), selection: $mapSelection) {
            // Directly add Markers (no need for a ForEach wrapper)
            ForEach(placeMarks) { placemark in
                Marker(
                    placemark.name,
                    systemImage: "star",
                    coordinate: placemark.coordinate
                ).tag(placemark)
            }
            Annotation("My Location", coordinate: region.center) {
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
        .onAppear {
            PlacemarkManager.shared.loadPlacemarks()
            placeMarks = PlacemarkManager.shared.placemarks
        }
        .onChange(of: mapSelection, { oldValue, newValue in
            // this is where we put the selection to show the detail view
            if let name = newValue?.name {
                print(name)
            }
        })
        .mapControls {
            MapCompass()
            MapPitchToggle()
            MapUserLocationButton()
        }
    }
}
// Preview with actual data
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        // Load real data into the preview
        let placemarkManager = PlacemarkManager.shared
        placemarkManager.loadPlacemarks()

        return MapView()
            .onAppear {
                // Simulate the data load in the preview
                placemarkManager.loadPlacemarks()
            }
    }
}
