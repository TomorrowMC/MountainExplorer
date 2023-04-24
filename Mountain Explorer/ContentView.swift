//
//  ContentView.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/22.
//

import SwiftUI

struct ContentView: View {
    @State var tmpInt = 0
    @State var searchText: String = ""
    var body: some View {
        GeometryReader { geometry in
            NavigationStack{
                ScrollView {
                    VStack {
                        SearchBarView(searchText: $searchText)
                        VStack(alignment:.leading){
                            Text("Mount Song")
                                .font(.largeTitle).bold()
                            Text("A scenic area located in the northern part of Henan Province, China, the mountain is known for its picturesque natural scenery.")
                                .font(.callout)
                        }
                        .padding()
                        MountainScrollView()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                            .padding(.vertical)
                        FilterView()
                            .padding(.vertical)
                    }
                }
                .background(
                    Image("good")
                        .resizable()
                        .scaledToFill()
                        .blur(radius: 5)
                        .frame(width: .infinity, height: .infinity)
                        .ignoresSafeArea()
                )
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
