//
//  MainPageInfo.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/22.
//

import Foundation
import MapKit

class Mountain:Identifiable {
    let uuid = UUID()
    let id: Int
    let name: String
    let length: Double
    let altitude: Double
    let time: String
    let tags: [String]
    var likedCount: String
    let province: String
    let location: CLLocationCoordinate2D
    var offsetX: CGFloat
    var offsetY: CGFloat
    let rate: Int
    let peopleflow: Int
    let energyConsumption: Int
    let climbingTools: [String]
    let introduction: String
    
    init(id:Int, name: String, length: Double, altitude: Double, time: String, tags: [String], likedCount: String, province: String, location: CLLocationCoordinate2D, rate: Int, peopleflow: Int, energyConsumption: Int, climbingTools: [String], introduction: String) {
        self.id = id
        self.name = name
        self.length = length
        self.altitude = altitude
        self.time = time
        self.tags = tags
        self.likedCount = likedCount
        self.province = province
        self.location = location
        self.offsetX = CGFloat(Int.random(in: -150...(-30)))
        self.offsetY = CGFloat(Int.random(in: -150...(-20)))
        self.rate = rate
        self.peopleflow = peopleflow
        self.energyConsumption = energyConsumption
        self.climbingTools = climbingTools
        self.introduction = introduction
    }
    
    static let shared = MountainData()
}

struct MountainData {
        var mountains: [Mountain] = [
            Mountain(id:1, name: "MOUNTAIN WUGONG", length: 10.67, altitude: 1678, time: "6h 50min", tags: ["Medium", "Impressed"], likedCount: "12.5k", province: "JIANG XT", location: CLLocationCoordinate2D(latitude: 0, longitude: 0), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Wugong Mountain, also known as Wu Peak, is located in the northwest of Jiangxi Province. It is the highest peak in Jiangxi Province with an altitude of 1918 meters."),
            Mountain(id:2, name: "YELLOW MOUNTAIN", length: 15.67, altitude: 2560, time: "12h 50min", tags: ["Hard", "Legendary"], likedCount: "12.5k", province: "AN HUI", location: CLLocationCoordinate2D(latitude: 0.001, longitude: 0), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Yellow Mountain, located in Huangshan City, Anhui Province, is a famous scenic spot in China, famous for its beautiful natural scenery and unique pine landscapes."),
            Mountain(id:7, name: "MOUNT LUSHAN", length: 5.67, altitude: 578, time: "3h 50min", tags: ["Easy", "Beautiful"], likedCount: "12.5k", province: "JIANG XI", location: CLLocationCoordinate2D(latitude: 0.001, longitude: 0), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Mount Lushan is located in the northern part of Jiangxi Province. It is one of the famous mountains in China and one of the UNESCO World Natural Heritage Sites."),
            Mountain(id:3, name: "MOUNT EMEI", length: 20, altitude: 3099, time: "16h", tags: ["Hard", "Sacred"], likedCount: "8.3k", province: "SICHUAN", location: CLLocationCoordinate2D(latitude: 0.001, longitude: 0), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Mount Emei, located in the southwest of Sichuan Province, is one of the Four Sacred Buddhist Mountains in China."),
            Mountain(id:4, name: "MOUNT HUA", length: 12, altitude: 2154, time: "8h", tags: ["Hard", "Steep"], likedCount: "10.7k", province: "SHAAN XI", location: CLLocationCoordinate2D(latitude: 0.001, longitude: 0), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Mount Hua, located in Huayin City, Shaanxi Province, is one of the Five Great Mountains in China. It is known for its steep terrain and unique natural scenery."),
            Mountain(id:6,name: "MOUNT CHANGBAI", length: 13, altitude: 2691, time: "7h 30min", tags: ["Hard", "Volcanic"], likedCount: "6.2k", province: "JILIN",location: CLLocationCoordinate2D(latitude: 42.039278, longitude: 128.085556), rate: Int.random(in: 3...5), peopleflow: Int.random(in: 3...5), energyConsumption: Int.random(in: 3...5), climbingTools: ["Climbing Pole", "Tent", "Raincoat", "Rope"], introduction: "Changbai Mountain is located on the border between China and North Korea. It is a famous mountain range in northeastern China, with Changbai Mountain as the main peak, which is 2691 meters above sea level. The scenic area is a comprehensive nature reserve integrating forest, volcanic and wetland ecosystems.")
    ]

}

