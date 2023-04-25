//
//  HelperView.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/24.
//

import SwiftUI
import MapKit

struct HelperView: View {
    let mountain: Mountain
    var body: some View {
        VStack(alignment: .leading) {
            Text("Help")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            HStack{
                Image(systemName:"star.fill")
                    .foregroundColor(.yellow)
                    .frame(height: 20)
                Text("Rating: This is a measure of how highly this mountain is rated by other climbers.")}
                .padding(.bottom, 10)
            HStack{
                Image(systemName:"person.fill")
                    .foregroundColor(.cyan)
                    .frame(height: 20)
                Text("People Flow: This is an estimate of how many other climbers you can expect to see on the mountain.")}
                .padding(.bottom, 10)
            HStack{
                Image(systemName:"bolt.fill")
                    .foregroundColor(.red)
                    .frame(height: 20)
                Text("Energy Consumption: This is an estimate of how physically demanding the climb is.")}
                .padding(.bottom, 10)
            HStack{
                Image("Climbing Pole")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20,height: 20)
                Text("Climbing Pole: This is used for stability and balance.")}
                .padding(.bottom, 10)
            HStack{
                Image("Tent")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20,height: 20)
                Text("Tent: This is used for camping overnight.")
                }
                .padding(.bottom, 10)
            HStack{
                Image("Raincoat")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20,height: 20)
                    
                Text("Raincoat: This is used to stay dry in wet weather.")}
                .padding(.bottom, 10)
            HStack{
                Image("Rope")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 20,height: 20)
                    
                Text("Rope: This is used to help with climbing.")}
                .padding(.bottom, 10)




        }
        .padding()
    }
}

struct HelperView_Previews: PreviewProvider {
    static var previews: some View {
        HelperView(mountain:             Mountain(id:6,name: "MOUNT CHANGBAI", length: 13, altitude: 2691, time: "7h 30min", tags: ["Hard", "Volcanic"], likedCount: "6.2k", province: "JILIN",location: CLLocationCoordinate2D(latitude: 42.039278, longitude: 128.085556), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Changbai Mountain is located on the border between China and North Korea. It is a famous mountain range in northeastern China, with Changbai Mountain as the main peak, which is 2691 meters above sea level. The scenic area is a comprehensive nature reserve integrating forest, volcanic and wetland ecosystems."))
    }
}
