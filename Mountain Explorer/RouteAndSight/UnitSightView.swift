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
                    .scaledToFill()
                    .frame(width: 120, height: 100)
                    .cornerRadius(10)
                    .padding(.trailing)
                VStack(alignment: .listRowSeparatorLeading){
                    Text(sight.name)
                        .font(.headline)
                    HStack {
                        if sight.supplies.isEmpty{
                            Text("No supplies")
                                .font(.footnote)
                                .frame(height: 20)
                        }else{
                            ForEach(sight.supplies, id: \.self) { supply in
                                Image(supply) // Replace with the corresponding image for each supply
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20,height: 20)
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
                    HStack {
                        HStack{
                            Rectangle()
                                .frame(width: 5, height: 50)
                            VStack(alignment:.leading) {
                                Text(distance)
                                    .font(.caption)
                                Text(time)
                                    .font(.caption)
                            }
                        }
                        .padding(.leading,50)
                        Spacer()
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
