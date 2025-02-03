
import SwiftUI
import MapKit

import SwiftUI
import MapKit

struct MapView: View {
    @State private var placeMarks: [ModelPlacemark] = []
    @State private var mapSelection: ModelPlacemark?
    
    private var region: MKCoordinateRegion {
        MapRegionManager.defaultRegion
    }

    var body: some View {
        Map(initialPosition: .region(region), selection: $mapSelection) {
            // Directly add Markers (no need for a ForEach wrapper)
            
            // maybe we make a marker file? IDK if it's needed
            ForEach(placeMarks) { placemark in
                Marker(
                    placemark.name,
                    systemImage: "star",
                    coordinate: placemark.coordinate
                ).tag(placemark)
            }
            Annotation("My Location", coordinate: region.center) {
                UserLocationAnnotation()
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
