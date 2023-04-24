import SwiftUI
import MapKit

struct FindDestinationView: View {
    @State var mountains: [Mountain] = MountainData().mountains
    @State var selectedId: Int = 0
    @State var searchText: String
    @Environment(\.presentationMode) var presentationMode
    
    var filteredMountains: [Mountain] {
        if searchText.isEmpty {
            return mountains
        } else {
            return mountains.filter { $0.name.contains(searchText) }
        }
    }
    
    init(searchText:String="") {
        _searchText = State(initialValue: searchText)
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
                
                ForEach(filteredMountains) { location in
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(location.id == selectedId ? Color.red : Color.blue)
                        .font(.title)
                        .offset(x: location.offsetX, y: location.offsetY)
                        .animation(.easeInOut(duration: 0.5), value: selectedId)
                }
                VStack{
                    Spacer()

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(filteredMountains) { mountain in
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
                                                    .padding(.bottom, 35)
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
        .navigationBarHidden(true)
    }
}


struct FindDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        FindDestinationView()
    }
}
