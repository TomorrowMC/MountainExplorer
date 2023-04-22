//
//  MainPageInfo.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/22.
//

class Mountain {
    let name: String
    let length: Double
    let altitude: Double
    let time: String
    let tags: [String]
    var likedCount: String
    let province: String
    
    init(name: String, length: Double, altitude: Double, time: String, tags: [String], likedCount: String, province: String) {
        self.name = name
        self.length = length
        self.altitude = altitude
        self.time = time
        self.tags = tags
        self.likedCount = likedCount
        self.province = province
    }
    
    static let shared = MountainData()
}

struct MountainData {
    var mountains: [Mountain] = [
        Mountain(name: "MOUNTAIN WUGONG", length: 10.67, altitude: 1678, time: "6h 50min", tags: ["Medium", "Impressed"], likedCount: "12.5k", province: "JIANG XT"),
        Mountain(name: "YELLOW MOUNTAIN", length: 15.67, altitude: 2560, time: "12h 50min", tags: ["Hard", "Legendary"], likedCount: "12.5k", province: "AN HUI"),
        Mountain(name: "MOUNT LUSHAN", length: 5.67, altitude: 578, time: "3h 50min", tags: ["Easy", "Beautiful"], likedCount: "12.5k", province: "JIANG XI")
    ]
}

