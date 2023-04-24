//
//  Sports.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/24.
//

import SwiftUI
import MapKit
struct MapView: UIViewRepresentable {
    @Binding var region: MKCoordinateRegion

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        view.setRegion(region, animated: true)

        // Add an annotation to the center of the region
        let annotation = MKPointAnnotation()
        annotation.coordinate = region.center
        view.addAnnotation(annotation)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(_ parent: MapView) {
            self.parent = parent
        }
    }
}



struct TrackingView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29.58, longitude: 113.41), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    @State private var showEndAndResume = false
    @State private var elapsedTime = 0
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            MapView(region: $region)
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
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
                    Spacer()
                }
                Spacer()
            }
            
            VStack {
                Spacer()
                VStack {
                    if !showEndAndResume {
                        Button(action: {
                            withAnimation {
                                showEndAndResume = true
                                timer.upstream.connect().cancel()
                            }
                        }) {
                            Text("Pause")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(
                                    Capsule()
                                        .foregroundColor(.white)
                                        .overlay(
                                            Capsule()
                                                .stroke(Color.yellow, lineWidth: 5)
                                        )
                                )
                                .foregroundColor(Color.yellow)
                        }
                    } else {
                        HStack {
                            Button(action: {
                                withAnimation {
                                    showEndAndResume = false
                                    presentationMode.wrappedValue.dismiss()
                                }
                            }) {
                                Text("End")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(
                                        Capsule()
                                            .foregroundColor(.white)
                                            .overlay(
                                                Capsule()
                                                    .stroke(Color.red, lineWidth: 5)
                                            )
                                    )
                                    .foregroundColor(Color.red)
                            }
                            .padding(.trailing)

                            Button(action: {
                                withAnimation {
                                    showEndAndResume = false
                                    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                }
                            }) {
                                Text("Resume")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 20)
                                    .padding(.vertical, 10)
                                    .background(
                                        Capsule()
                                            .foregroundColor(.white)
                                            .overlay(
                                                Capsule()
                                                    .stroke(Color.green, lineWidth: 5)
                                            )
                                    )
                                    .foregroundColor(Color.green)
                            }
                        }
                    }


                    Text(String(format: "%02d:%02d", elapsedTime / 60, elapsedTime % 60))
                        .font(.largeTitle)
                        .onReceive(timer, perform: { _ in
                            if !showEndAndResume {
                                elapsedTime += 1
                            }
                        })

                    HStack {
                        VStack {
                            Text("10")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("km")
                                .font(.headline)
                            Text("Next sight")
                                .font(.caption)
                        }
                        .padding()

                        VStack {
                            Text("10")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("km")
                                .font(.headline)
                            Text("Distanced")
                                .font(.caption)
                        }
                        .padding()

                        VStack {
                            Text("5321")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                            Text("kcal")
                                .font(.headline)
                            Text("Energy")
                                .font(.caption)
                        }
                        .padding()
                    }
                    .frame(width: .infinity)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25).foregroundColor(.white).opacity(0.8).padding(.horizontal))
                .padding(.bottom,50)
                
            }
            
        }
    }
}






struct Sports_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
