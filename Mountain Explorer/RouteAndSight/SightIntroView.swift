//
//  SightIntro.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/24.
//

import SwiftUI

import SwiftUI

struct SightInfoView: View {
    let sight: Sight
    let supplies = ["Restroom", "Small shop", "Camping spot", "Fire pit", "Observation deck"]
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    HStack {
                        Button(action: {
                            // Add your navigation back action here
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
                    Text(sight.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    LazyVGrid(columns: [
                        GridItem(.adaptive(minimum: 150)),
                        GridItem(.adaptive(minimum: 150))
                    ]){
                            ForEach(supplies, id: \.self) { supply in
                                HStack(alignment:.firstTextBaseline) {
                                    Text(supply + ":")
                                    
                                    if sight.supplies.contains(supply) {
                                        Image(systemName: "checkmark")
                                            .foregroundColor(.green)
                                    } else {
                                        Image(systemName: "xmark")
                                            .foregroundColor(.red)
                                    }
                                }
                                .alignmentGuide(.leading) { _ in 0 }
                                .padding(.top,3)
                        }
                    }
                    .padding(.top)
                    
                    Text("Introduction:")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    Text(sight.detailedDescription)
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


struct SightIntro_Previews: PreviewProvider {
    static var previews: some View {
        SightInfoView(sight: Sight.example)
    }
}
