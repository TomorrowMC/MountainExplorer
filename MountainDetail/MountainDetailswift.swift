//
//  MountainDetailswift.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/22.
//

import SwiftUI
import MapKit

struct MountainDetailView: View {
    @State private var isPresented = false
    @Environment(\.presentationMode) var presentationMode
    let mountain: Mountain
    var body: some View {
        ScrollView{
                ZStack {
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
                            .padding()
                            Spacer()
                        }
                        Spacer()
                    }
                    VStack(alignment: .leading) {
                        Text(mountain.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 20) {
                            VStack(alignment: .leading) {
                                Text("Rating:")
                                HStack {
                                    ForEach(1...5, id: \.self) { index in
                                        Image(systemName: index <= mountain.rate ? "star.fill" : "star")
                                            .foregroundColor(index <= mountain.rate ? .yellow : .gray)
                                            .animation(.easeInOut(duration: 0.3)) // 添加动画效果
                                    }
                                    Spacer()
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text("People Flow:")
                                HStack {
                                    ForEach(1...5, id: \.self) { index in
                                        Image(systemName: index <= mountain.peopleflow ? "person.fill" : "person")
                                            .foregroundColor(index <= mountain.peopleflow ? .cyan : .gray)
                                            .animation(.easeInOut(duration: 0.3)) // 添加动画效果
                                    }
                                    Spacer()
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Energy Consumption:")
                                HStack {
                                    ForEach(1...5, id: \.self) { index in
                                        Image(systemName: index <= mountain.energyConsumption ? "bolt.fill" : "bolt")
                                            .foregroundColor(index <= mountain.energyConsumption ? .red : .gray)
                                            .animation(.easeInOut(duration: 0.3)) // 添加动画效果
                                    }
                                    Spacer()
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                Text("Climbing Tools:")
                                HStack {
                                    ForEach(mountain.climbingTools, id: \.self) { tool in
                                        Image(systemName: tool) // 请根据实际的图片名称替换
                                    }
                                    Spacer()
                                }
                            }
                        }
                        
                        
                        .padding(.top)
                        
                        Text("Introduction:")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.top)
                        
                        Text(mountain.introduction)
                        HStack{

                            Spacer()
                            NavigationStack{
                                NavigationLink(destination: CustomMapView()){
                                    Text("Route →")
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
                                        .padding(.top, 8) // Add padding here
                                }
                                .padding(.top)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25).foregroundColor(.white).opacity(0.8).padding(.horizontal))
                    .padding(.top, UIScreen.main.bounds.height * 0.33)
                }
                .background(
                    Image("good")
                        .resizable()
                        .scaledToFill()
                        .frame(width: .infinity, height: .infinity)
                        .edgesIgnoringSafeArea(.all)
                        .ignoresSafeArea()
                )
        }
        .navigationBarHidden(true)
    }
}

struct MountainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MountainDetailView(mountain: Mountain(id:4, name: "MOUNT HUA", length: 12, altitude: 2154, time: "8h", tags: ["Hard", "Steep"], likedCount: "10.7k", province: "SHAAN XI", location: CLLocationCoordinate2D(latitude: 0.001, longitude: 0), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Mount Hua, located in Huayin City, Shaanxi Province, is one of the Five Great Mountains in China. It is known for its steep terrain and unique natural scenery."))
    }
}

