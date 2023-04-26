//
//  SearchBarComp.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/25.
//

import SwiftUI

import SwiftUI

enum PresentationStyle {
    case sheet, navigationLink
}

struct customerSearchBar<Destination: View>: View {
    
    @Binding var searchText: String
    @State private var searchPrompt = ""
    @State private var showSearchPrompt = true
    @State var showText: Bool = true
    @State private var showSearchResult = false
    @State private var isPresented = false

    let searchTip: String
    let searchPrompts: [String]
    let destination: Destination
    let presentationStyle: PresentationStyle

    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

    init(searchText: Binding<String>, searchTip: String = "Popular:", searchPrompts: [String] = [], destination: Destination, presentationStyle: PresentationStyle) {
        self._searchText = searchText
        self.searchTip = searchTip
        self.searchPrompts = searchPrompts
        self.destination = destination
        self.presentationStyle = presentationStyle
    }

    var body: some View {
        ZStack {
            HStack{
                TextField("", text: $searchText, onCommit: {
                    showSearchResult = true
                })
                .font(.caption)
                .foregroundColor(.primary)
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.leading,37)
                .frame(height: 40)
                .background(RoundedRectangle(cornerRadius: 20).fill(.white.opacity(0.8)))
                .padding(.horizontal)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading,30)
                        if showSearchPrompt {
                            if showText{
                                Text("\(searchTip)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                                Text(searchPrompt)
                                .font(.footnote)
                                .foregroundColor(.gray)
                                .bold()
                                .onReceive(timer) { _ in
                                    if !searchPrompts.isEmpty{
                                        searchPrompt = searchPrompts.randomElement()!
                                    }
                            }
                        }
                        }
                        Spacer()
                    }
                        .allowsHitTesting(false)
                )
                .onChange(of: searchText) { text in
                    showSearchPrompt = text.isEmpty
                }
            }
            HStack{
                Spacer()
                Button(action: {
                    isPresented = true
                }) {
                    Text("Search")
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 5)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                .padding(.trailing,20)
            }
        }
        .background(presentationView)
    }

    // 根据 presentationStyle 添加不同的视图
    @ViewBuilder
    private var presentationView: some View {
        switch presentationStyle {
        case .sheet:
            sheet(isPresented: $isPresented, content: { destination })
        case .navigationLink:
            NavigationLink("", destination: destination, isActive: $isPresented)
                .opacity(0) // 隐藏 NavigationLink
        }
    }
}
