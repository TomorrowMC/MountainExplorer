import SwiftUI
import MapKit

struct FindDestinationView: View {
    var locations: [Mountain] = MountainData().mountains
    @State var mountains: [Mountain] = MountainData().mountains
    @State var selectedId: Int = 0
    
    init() {
        var locations: [Mountain] = MountainData().mountains
        for i in locations.indices {

        }
        self.mountains = locations
    }
    var body: some View {
        NavigationStack{
            ZStack {
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude:29.58 , longitude: 113.41), span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta:50))), interactionModes: .all)
                    .edgesIgnoringSafeArea(.all)
                
                ForEach(locations) { location in
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(location.id == selectedId ? Color.red : Color.blue)
                        .font(.title2)
                        .offset(x: location.offsetX, y: location.offsetY)
                        .animation(.easeInOut(duration: 0.5), value: selectedId)
                }
                VStack{
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(mountains) { mountain in
                                VStack{
                                    MountainView(mountain: mountain)
                                        .frame(width: 200, height: 290)
                                        .onTapGesture {
                                            if selectedId != mountain.id {
                                                withAnimation(.easeInOut(duration: 0.5)) {
                                                    selectedId = mountain.id
                                                }
                                            }
                                        }
                                    if selectedId == mountain.id {
                                        NavigationStack{
                                            NavigationLink(destination: MountainDetailView(mountain: mountain)){
                                                Text("Detail →")
                                                    .font(.title2)
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
                                                    .foregroundColor(.blue)
                                                    .padding(.top, 8)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 290)
                }
            }
        }
    }
}

struct FindDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        FindDestinationView()
    }
}
