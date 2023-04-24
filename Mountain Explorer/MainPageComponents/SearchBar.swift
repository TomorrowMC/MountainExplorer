import SwiftUI

struct SearchResultView: View {
    let searchText: String
    
    var body: some View {
        Text("未找到关于\(searchText)的内容")
            .font(.title)
            .padding()
    }
}

struct SearchBarView: View {
    
    @Binding var searchText:String
    @State private var searchPrompt = ""
    @State private var searchPrompts = ["Mount Huangshan", "Mount Tai", "Mount Wugong", "Mount Changbai"]
    @State private var showSearchPrompt = true
    @State private var showSearchResult = false
    @State var showText:Bool = true

    let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()

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

                                    Text("Popular:")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    Text(searchPrompt)
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                                    .bold()
                                    .onReceive(timer) { _ in
                                    searchPrompt = searchPrompts.randomElement()!
                                }
                            }
                            }
                            Spacer()
                        }
                    )
                    .onChange(of: searchText) { text in
                        showSearchPrompt = text.isEmpty
                    }
                }
                HStack{
                    Spacer()
                    if showText{
                        Button(action: {
                            showSearchResult = true
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
            }
        .sheet(isPresented: $showSearchResult) {
            FindDestinationView(searchText: searchText)
        }
    }
}

