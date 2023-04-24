import SwiftUI
import MapKit

struct CustomMapView: View {
    @State private var selectedRoute = 0
    @State var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var center =  CLLocationCoordinate2D(latitude: 29.48, longitude: 113.42)
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.58, longitude: 113.41), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
    let routeSights = RouteSights()
    
    var currentSightList: [Sight] {
        switch selectedRoute {
        case 0:
            return routeSights.sightList1
        case 1:
            return routeSights.sightList2
        case 2:
            return routeSights.sightList3
        default:
            return []
        }
    }
    let routeCoordinates: [[CLLocationCoordinate2D]] = [
        [
            CLLocationCoordinate2D(latitude: 29.58, longitude: 113.41),
            CLLocationCoordinate2D(latitude: 29.63, longitude: 113.45)
        ],
        [
            CLLocationCoordinate2D(latitude: 29.58, longitude: 113.41),
            CLLocationCoordinate2D(latitude: 29.56, longitude: 113.44)
        ],
        [
            CLLocationCoordinate2D(latitude: 29.58, longitude: 113.41),
            CLLocationCoordinate2D(latitude: 29.52, longitude: 113.39)
        ]
    ]
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                routeLines(selectedRoute: selectedRoute, routeCoordinates: routeCoordinates, initialRegion: MKCoordinateRegion(center: self.center, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
                    .ignoresSafeArea()
            }
            VStack{
                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("← Back")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .foregroundColor(.white)
                            )
                            .foregroundColor(.yellow)
                    }
                    .padding(.leading)
                    SearchBarView(searchText: $searchText,showText: false)
                    Spacer()
                }
                .padding(.top)
               
                Spacer()
            }
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink{
                        FindDestinationView()
                    }label: {
                        Text("Start→")
                            .font(.callout)
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .foregroundColor(.white)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.blue, lineWidth: 5)
                                    )
                            )
                            .foregroundColor(Color.blue)
                    }
                }
                VStack {
                    Picker(selection: $selectedRoute, label: Text("选择路径")) {
                        Text("👑Route 1").tag(0)
                        Text("Route 2").tag(1)
                        Text("Route 3").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding()

                    ScrollView {
                        VStack {
                            ForEach(currentSightList.filter { searchText.isEmpty ? true : $0.name.contains(searchText) }, id: \.name) { sight in
                                SightDetailView(sight: sight)
                            }
                        }
                        
                    }
                    
                }
                .frame(height: UIScreen.main.bounds.height * 1 / 2)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.8)))
                
            }
            .padding()
            
        }
        .navigationBarHidden(true)
    }
        
}

struct IdentifiableCoordinate: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}


struct routeLines: UIViewRepresentable {
    var selectedRoute: Int
    var routeCoordinates: [[CLLocationCoordinate2D]]
    var initialRegion: MKCoordinateRegion

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.setRegion(initialRegion, animated: false)
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
