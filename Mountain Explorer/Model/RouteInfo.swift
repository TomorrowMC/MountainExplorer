//
//  RouteInfo.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/24.
//

import Foundation
import Foundation

class Sight {
    var image: String
    var name: String
    var supplies: [String]
    var distanceToNextSight: String?
    var timeToNextSight: String?
    var briefDescription: String
    var detailedDescription: String
    
    init(image: String, name: String, supplies: [String], distanceToNextSight: String? = nil, timeToNextSight: String? = nil, briefDescription: String, detailedDescription: String) {
        self.image = image
        self.name = name
        self.supplies = supplies
        self.distanceToNextSight = distanceToNextSight
        self.timeToNextSight = timeToNextSight
        self.briefDescription = briefDescription
        self.detailedDescription = detailedDescription
    }
}

class RouteSights {
    var sightList1: [Sight]
    var sightList2: [Sight]
    var sightList3: [Sight]
    
    init() {
        sightList1 = [
            Sight(image: "sight1.jpg", name: "Sunrise Peak", supplies: ["Restroom", "Small shop", "Camping spot", "Fire pit", "Observation deck"], distanceToNextSight: "1.5km", timeToNextSight: "50min", briefDescription: "The most spectacular viewpoint", detailedDescription: "This is the highest peak of the mountain and offers an unparalleled view. It was selected as one of the best viewpoints in China in 2000 and has an altitude of 1500 meters."),
            Sight(image: "sight2.jpg", name: "Pine Forest", supplies: ["Restroom", "Picnic area"], distanceToNextSight: "2km", timeToNextSight: "40min", briefDescription: "A peaceful forest with tall pine trees", detailedDescription: "This beautiful pine forest is home to many native bird species and offers a serene atmosphere for relaxation and exploration."),
            Sight(image: "sight3.jpg", name: "Misty Lake", supplies: ["Boat rental", "Small shop"], distanceToNextSight: "1.2km", timeToNextSight: "30min", briefDescription: "A tranquil lake surrounded by mountains", detailedDescription: "Misty Lake is the perfect spot to unwind and enjoy nature. Rent a boat and paddle around the lake or simply sit by the water and take in the breathtaking views."),
            Sight(image: "sight4.jpg", name: "Hidden Waterfall", supplies: [], distanceToNextSight: "3km", timeToNextSight: "1hr 20min", briefDescription: "A secluded waterfall with a refreshing pool", detailedDescription: "The Hidden Waterfall can be found after a short hike through the forest. Enjoy a refreshing swim in the natural pool at the base of the waterfall."),
            Sight(image: "sight5.jpg", name: "Sunset Valley", supplies: ["Restroom", "Camping spot"], distanceToNextSight: nil, timeToNextSight: nil, briefDescription: "The perfect spot to watch the sunset", detailedDescription: "Sunset Valley is an idyllic location to watch the sun setting behind the mountains. Bring a picnic and enjoy a peaceful evening as the sky turns vibrant colors.")
        ]
        
        sightList2 = [
            Sight(image: "sight6.jpg", name: "Cloud Bridge", supplies: ["Restroom", "Cable car", "Observation deck"], distanceToNextSight: "1.8km", timeToNextSight: "1hr", briefDescription: "A bridge above the clouds", detailedDescription: "The Cloud Bridge is a suspension bridge that is located above the clouds. It offers stunning views of the surrounding mountains and is a popular spot for photography."),
            Sight(image: "sight7.jpg", name: "Bamboo Forest", supplies: ["Restroom", "Picnic area"], distanceToNextSight: "2.5km", timeToNextSight: "1hr 10min", briefDescription: "A peaceful forest with towering bamboo trees", detailedDescription: "The Bamboo Forest is a tranquil location with tall bamboo trees that sway in the breeze. It is home to many native animals and birds, and is a great place to enjoy a picnic."),
            Sight(image: "sight8.jpg", name: "Mystic Cave", supplies: [], distanceToNextSight: "3.2km", timeToNextSight: "1hr 40min", briefDescription: "A mysterious cave with underground waterfalls", detailedDescription: "The Mystic Cave is a hidden gem that can be explored on foot. It is home to underground waterfalls, stalactites, and stalagmites, and offers a unique adventure for those willing to venture inside."),
            Sight(image: "sight9.jpg", name: "Golden Meadow", supplies: ["Restroom", "Camping spot", "Small shop"], distanceToNextSight: "1.5km", timeToNextSight: "40min", briefDescription: "A field of golden flowers", detailedDescription: "The Golden Meadow is a beautiful location with a vast field of yellow flowers. It is a popular spot for photography, and visitors can enjoy camping and shopping at the nearby facilities."),
            Sight(image: "sight10.jpg", name: "Eagle's Nest", supplies: ["Restroom", "Observation deck", "Cable car"], distanceToNextSight: nil, timeToNextSight: nil, briefDescription: "A lookout point high above the mountains", detailedDescription: "The Eagle's Nest is a lookout point that is located high above the mountains. It offers stunning panoramic views of the surrounding area, and is accessible via cable car.")
        ]
        
        sightList3 = [
            Sight(image: "sight11.jpg", name: "Crystal Cave", supplies: ["Flashlight", "Helmet"], distanceToNextSight: "2.5km", timeToNextSight: "1hr", briefDescription: "An underground cave with stunning crystal formations", detailedDescription: "Explore the magical underground world of Crystal Cave and marvel at the beautiful crystal formations. Don't forget to bring a flashlight and a helmet for safety!"),
            Sight(image: "sight12.jpg", name: "Eagle's Nest", supplies: ["Telescope", "Warm clothing"], distanceToNextSight: "3km", timeToNextSight: "1hr 10min", briefDescription: "A high cliff with an eagle's-eye view of the valley", detailedDescription: "Climb to the top of Eagle's Nest and enjoy the panoramic view of the valley below. Bring a telescope and some warm clothing for a comfortable and enjoyable experience."),
            Sight(image: "sight13.jpg", name: "Bamboo Grove", supplies: ["Picnic basket", "Insect repellent"], distanceToNextSight: "1.5km", timeToNextSight: "50min", briefDescription: "A peaceful grove with tall bamboo trees", detailedDescription: "Walk through the serene Bamboo Grove and listen to the soothing rustle of bamboo leaves. Bring a picnic basket and some insect repellent to fully enjoy this peaceful oasis."),
            Sight(image: "sight14.jpg", name: "Waterfall Vista", supplies: ["Raincoat", "Hiking shoes"], distanceToNextSight: "2.5km", timeToNextSight: "1hr", briefDescription: "A scenic vista with a stunning waterfall", detailedDescription: "Admire the magnificent Waterfall Vista and feel the refreshing mist on your face. Don't forget to bring a raincoat and some hiking shoes for a safe and enjoyable hike."),
            Sight(image: "sight15.jpg", name: "Sky Bridge", supplies: ["Camera", "Comfortable shoes"], distanceToNextSight: nil, timeToNextSight: nil, briefDescription: "A suspension bridge with a thrilling view", detailedDescription: "Walk across the exhilarating Sky Bridge and feel the rush of adrenaline as you admire the stunning mountain scenery. Bring a camera and some comfortable shoes for a memorable experience.")
        ]
    }
}
