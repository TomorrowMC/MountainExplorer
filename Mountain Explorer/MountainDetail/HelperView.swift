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
        ScrollView{
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
                    Text("Generally speaking, it is better to climb when the crowd is three stars, it is not too crowded and you can get enough security.")}
                .padding(.bottom, 10)
                HStack{
                    Image(systemName:"bolt.fill")
                        .foregroundColor(.red)
                        .frame(height: 20)
                    Text("Energy Consumption: Typically, three stars for physical exertion means that you can summit the mountain without food, and four stars means that most people need to carry food containing at least 200 grams of protein to make it to the top. Five stars for physical exertion means you may need to prepare a two-meal energy supplement to help you make the summit.")}
                .padding(.bottom, 10)
                HStack{
                    Image("Climbing Pole")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                    Text("Climbing Pole: The mountain may not be steep, or some sections may be strenuous to climb with your bare hands,this sign means you may need to use Pole.")}
                .padding(.bottom, 10)
                HStack{
                    Image("Tent")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                    Text("Tent: This peak may not be climbed in one day, or some climbers like to climb it at night,this sign means you may need to bring a tent.")
                }
                .padding(.bottom, 10)
                HStack{
                    Image("Raincoat")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                    
                    Text("Raincoat: The weather on the mountain can be very changeable and you may often encounter thunderstorms, this sign means you need a raincoat.")}
                .padding(.bottom, 10)
                HStack{
                    Image("Rope")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20,height: 20)
                    
                    Text("Rope: You may encounter places on the mountain that require climbing with ropes, and you may need to have the corresponding expertise. This sign means that you may need to use rope during the climb.")}
                .padding(.bottom, 10)
            }
        }
        .padding()
    }
}

struct HelperView_Previews: PreviewProvider {
    static var previews: some View {
        HelperView(mountain:             Mountain(id:6,name: "MOUNT CHANGBAI", length: 13, altitude: 2691, time: "7h 30min", tags: ["Hard", "Volcanic"], likedCount: "6.2k", province: "JILIN",location: CLLocationCoordinate2D(latitude: 42.039278, longitude: 128.085556), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Changbai Mountain is located on the border between China and North Korea. It is a famous mountain range in northeastern China, with Changbai Mountain as the main peak, which is 2691 meters above sea level. The scenic area is a comprehensive nature reserve integrating forest, volcanic and wetland ecosystems."))
    }
}
