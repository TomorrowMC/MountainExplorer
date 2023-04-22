//
//  ContentView.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            VStack{
                SearchBarView()
            }
            Spacer()
            VStack{
                MountainView(mountain: MountainData().mountains[0])
                    .frame(width: 280, height: 380)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
