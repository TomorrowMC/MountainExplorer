//
//  MountainScrollView.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/22.
//
import SwiftUI

struct MountainScrollView: View {
    var mountains: [Mountain]
    
    init() {
        let allMountains = MountainData().mountains
        var selectedMountains: [Mountain] = []
        
        for _ in 0..<3 {
            if let randomMountain = allMountains.randomElement() {
                selectedMountains.append(randomMountain)
            }
        }
        
        self.mountains = selectedMountains
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(mountains) { mountain in
                    MountainView(mountain: mountain)
                        .frame(width: 200, height: 290)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 290)
    }
}

struct MountainScrollView_Previews: PreviewProvider {
    static var previews: some View {
        MountainScrollView()
    }
}
