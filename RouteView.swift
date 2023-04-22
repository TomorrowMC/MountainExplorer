import SwiftUI
import MapKit

struct CustomMapView: View {
    @State private var selectedRoute = 0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.58, longitude: 113.41), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let routeCoordinates: [[CLLocationCoordinate2D]] = [
        [
            CLLocationCoordinate2D(latitude: 29.58, longitude: 113.41),
            CLLocationCoordinate2D(latitude: 29.63, longitude: 113.45)
        ],
        [
            CLLocationCoordinate2D(latitude: 29.53, longitude: 113.42),
            CLLocationCoordinate2D(latitude: 29.56, longitude: 113.44)
        ],
        [
            CLLocationCoordinate2D(latitude: 29.50, longitude: 113.40),
            CLLocationCoordinate2D(latitude: 29.52, longitude: 113.39)
        ]
    ]
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: routeCoordinates.flatMap { $0 }.map { IdentifiableCoordinate(coordinate: $0) }) { identifiableCoordinate in
                MapMarker(coordinate: identifiableCoordinate.coordinate)
            }
            .onAppear {
                region.center = CLLocationCoordinate2D(latitude: 29.58, longitude: 113.41)
                region.span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            }
            .edgesIgnoringSafeArea(.all)
            .overlay(
                GeometryReader { geometry in
                    routeLines(selectedRoute: selectedRoute, routeCoordinates: routeCoordinates)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                }, alignment: .topLeading
            )
            
            Picker(selection: $selectedRoute, label: Text("选择路径")) {
                Text("1").tag(0)
                Text("2").tag(1)
                Text("3").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
        }
    }
}

struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}

struct routeLines: UIViewRepresentable {
    var selectedRoute: Int
    var routeCoordinates: [[CLLocationCoordinate2D]]
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeOverlays(uiView.overlays)
        
        for (index, coordinates) in routeCoordinates.enumerated() {
            let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
            polyline.title = (index == selectedRoute) ? "selected" : "default"
            uiView.addOverlay(polyline)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.lineWidth = 5
                if polyline.title == "selected" {
                    renderer.strokeColor = .blue
                } else {
                    renderer.strokeColor = .gray
                }
                return renderer
            }
            return MKOverlayRenderer()
        }
    }
}

struct CustomMapView_Previews: PreviewProvider {
    static var previews: some View {
        CustomMapView()
    }
}
