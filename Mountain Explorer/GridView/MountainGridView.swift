//
//  MountainGridView.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/24.
//

import SwiftUI

struct MountainGridView: View {
    @State var mountains: [Mountain] = MountainData.favorMountains
    @State private var isPresentingSightInfo: Mountain?

    var body: some View {
        ScrollView {
            let columns = [
                GridItem(.fixed(UIScreen.main.bounds.width / 2.1)),                GridItem(.fixed(UIScreen.main.bounds.width / 2.1))
            ]

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(mountains) { mountain in
                    NavigationLink {
                        MountainDetailView(mountain: mountain)
                    } label: {
                        GridViewUnit(mountain: mountain)
                            .frame(width: UIScreen.main.bounds.width / 2 - 32, height: 290)
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding(.horizontal)
        }
        .background(
            Image("favor")
                .resizable()
                .scaledToFill()
                .blur(radius: 5)
                .frame(width: .infinity, height: .infinity)
                .ignoresSafeArea()
        )
        .onAppear{
            self.mountains = MountainData.favorMountains
        }
    }
}

struct MountainGridView_Previews: PreviewProvider {
    static var previews: some View {
        MountainGridView(mountains: MountainData().mountains)
    }
}

