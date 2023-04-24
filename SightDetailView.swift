//
//  SightDetailView.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/24.
//

import SwiftUI
import SwiftUI

struct SightDetailView: View {
    let sight: Sight
    
    var body: some View {
        VStack {
            HStack {
                Image(sight.image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(10)
                    .padding(.trailing)
                
                VStack(alignment: .leading) {
                    Text(sight.name)
                        .font(.headline)
                    
                    HStack {
                        if sight.supplies.isEmpty{
                            Text("No supplies")
                                .font(.footnote)
                        }else{
                            ForEach(sight.supplies, id: \.self) { supply in
                                Image(supply) // Replace with the corresponding image for each supply
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 20)
                            }
                        }
                    }
                    
                    Text(sight.briefDescription)
                        .font(.subheadline)
                        .lineLimit(2)
                }
            }
            .padding()
            .frame(width: UIScreen.main.bounds.width * 0.8)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
            
            if let distance = sight.distanceToNextSight, let time = sight.timeToNextSight {
                VStack {
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: 5, height: 80)
                        VStack(alignment:.leading) {
                            Text(distance)
                                .font(.caption)
                            Text(time)
                                .font(.caption)
                        }
                        Spacer()
                    }
                }
            }else{
                Text("")
                    .padding(.bottom)
            }
        }
        .padding(.horizontal)
        
    }
}


struct SightDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SightDetailView(sight: Sight.example)
    }
}
