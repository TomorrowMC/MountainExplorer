//
//  MountainScrollView.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/22.
//
import SwiftUI

struct MountainScrollView: View {
    var mountains: [Mountain]
    @State private var isPresentingSightInfo :Mountain?

    
    init() {
        let allMountains = MountainData().mountains
        var selectedMountains: [Mountain] = []
        var selectedIndices: Set<Int> = []

        while selectedIndices.count < 3 {
            let randomIndex = Int.random(in: 0..<allMountains.count)
            if !selectedIndices.contains(randomIndex) {
                selectedIndices.insert(randomIndex)
                selectedMountains.append(allMountains[randomIndex])
            }
        }

        self.mountains = selectedMountains
    }

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(mountains) { mountain in
                    NavigationLink{
                        MountainDetailView(mountain: mountain)
                    }label: {
                        MountainView(mountain: mountain)
                            .frame(width: 200, height: 290)
                            .foregroundColor(.primary)
                    }
                    

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
