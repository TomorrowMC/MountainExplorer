//
//  GridViewUnit.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/24.
//

import SwiftUI
import SwiftUI

struct GridViewUnit: View {
    let mountain: Mountain
    
    @State private var isLiked = false
    @State private var inList = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white.opacity(0.8))
            .shadow(radius: 5)
            .overlay(
                VStack(alignment: .leading) {
                    VStack{
                        ZStack(alignment: .topTrailing) {
                            Image("good")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150,height: 130)
                                .cornerRadius(10)
                                .clipped()
                            if !inList{
                                Button(action: {
                                    if !isLiked{
                                        MountainData.favorMountains.append(mountain)
                                    }
                                    isLiked.toggle()
                                }) {
                                    HStack {
                                        Image(systemName: "heart.fill")
                                        Text(mountain.likedCount)
                                    }
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(isLiked ? Color.red : Color.gray)
                                    .cornerRadius(5)
                                    .padding(5)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(mountain.province)
                            .font(.footnote.bold())
                        
                        Text(mountain.name)
                            .font(.subheadline.bold())
                        Text(String(format: "Length: %.2f km", mountain.length))
                            .font(.footnote)
                        Text(String(format: "Altitude: %.2f m", mountain.altitude))
                            .font(.footnote)
                        Text("Time: \(mountain.time)")
                            .font(.footnote)
                        HStack {
                            ForEach(mountain.tags, id: \.self) { tag in
                                Text("#\(tag)")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .padding(.horizontal, 5)
                                    .padding(.vertical, 2)
                                    .background(tagColor(tag: tag))
                                    .cornerRadius(5)
                            }
                        }
                    }
                    

                }
            )
    }
    
    private func tagColor(tag: String) -> Color {
        switch tag {
        case "Easy":
            return .green
        case "Medium":
            return .yellow
        case "Hard":
            return .red
        default:
            return .blue
        }
    }
}

struct GridViewUnit_Previews: PreviewProvider {
    static var previews: some View {
        MountainView(mountain: MountainData().mountains[0])
            .frame(width: 200, height: 290)
            .background(Color.gray)
    }
}
