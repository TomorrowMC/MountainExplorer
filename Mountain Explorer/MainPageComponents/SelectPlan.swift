//
//  SelectPlan.swift
//  Mountain Explorer
//
//  Created by 胡逸飞 on 2023/4/22.
//
import SwiftUI

struct FilterView: View {
    enum ClimbingOption {
        case quick
        case professional
    }
    
    @State private var selectedOption: ClimbingOption = .quick
    private var frameHeight: CGFloat {
        selectedOption == .quick ? 520 : 740
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.white.opacity(0.8))
            .padding(.horizontal)
            .overlay(
                VStack {
                    HStack {
                        Button(action: {
                            withAnimation {
                                selectedOption = .quick
                            }
                        }) {
                            VStack {
                                Text("Quick\nClimbing")
                                if selectedOption == .quick {
                                    Rectangle()
                                        .frame(width: 50, height: 5)
                                }else{
                                    Rectangle()
                                        .foregroundColor(.white.opacity(0))
                                        .frame(width: 50, height: 5)
                                }
                            }
                        }
                        .foregroundColor(.primary)
                        .padding(.trailing,30)
                        Button(action: {
                            withAnimation {
                                selectedOption = .professional
                            }
                        }) {
                            VStack {
                                Text("Professional\nClimbing")
                                if selectedOption == .professional {
                                    Rectangle()
                                        .frame(width: 50, height: 5)
                                }else{
                                    Rectangle()
                                        .foregroundColor(.white.opacity(0))
                                        .frame(width: 50, height: 5)
                                }
                            }
                        }
                        .foregroundColor(.primary)
                    }
                    .font(.title3.bold())
                    
                    if selectedOption == .quick {
                        QuickClimbingSetting()
                    } else {
                        ProfessionalClimbingSetting()
                    }
                    
                    Spacer()
                }
                .padding()
            )
            .frame(height: frameHeight) // 修改这里的高度
    }
}

struct QuickClimbingSetting: View {
    @State private var selectedDifficulty: Int = 0
    @State private var selectedDistance: Int = 1
    @State private var selectedConsumption: Int = 2
    
    let difficulties = ["Easy", "Medium", "Hard"]
    let distances = ["<5km","5 km", "10 km", "20 km",">30km"]
    let consumptions = ["Low", "Medium", "High"]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Difficulty")
            Rectangle()
                .fill(Color.gray)
                .frame(width: 200, height: 1)
                .padding(.bottom, 8)
            customHardPicker(items: difficulties, selectedIndex: $selectedDifficulty)
            
            Text("Distance")
            Rectangle()
                .fill(Color.gray)
                .frame(width: 200, height: 1)
                .padding(.bottom, 8)
            customHardPicker(items: distances, selectedIndex: $selectedDistance)
            
            Text("Consumption")
            Rectangle()
            
                .fill(Color.gray)
                .frame(width: 200, height: 1)
                .padding(.bottom, 8)
                
            customHardPicker(items: consumptions, selectedIndex: $selectedConsumption)
            HStack{
                Spacer()
                NavigationStack{
                    NavigationLink{
                        FindDestinationView()
                    }label: {
                        Text("Go Now →")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .foregroundColor(.white)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.blue, lineWidth: 5)
                                    )
                            )
                            .foregroundColor(Color.blue)
                    }
                }
                Spacer()
            }
        }
        .font(.title3)
        .padding(.leading,10)
    }
    func customHardPicker(items: [String], selectedIndex: Binding<Int>) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(items.indices) { index in
                    Button(action: {
                        selectedIndex.wrappedValue = index
                    }) {
                        Text(items[index])
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(
                                        selectedIndex.wrappedValue == index
                                        ? (index == 0 ? .green : index == 1 ? .yellow :index == 2 ?  .red : .red)
                                            : .gray.opacity(0.4)
                                    )
                            )
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding(.bottom, 10)
    }

    func customPicker(items: [String], selectedIndex: Binding<Int>) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(items.indices) { index in
                    Button(action: {
                        selectedIndex.wrappedValue = index
                    }) {
                        Text(items[index])
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(selectedIndex.wrappedValue == index ? .blue : .gray.opacity(0.4))
                            )
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding(.bottom, 10)
    }
}

struct ProfessionalClimbingSetting: View {
    @State private var selectedDistance: Int = 1
    @State private var selectedConsumption: Int = 2
    @State private var selectedDuration: Int = 0
    @State private var selectedType: Int = 0
    @State private var selectedGroupSize: Int = 0

    let distances = ["5 km", "10 km", "20 km"]
    let consumptions = ["Low", "Moderate", "High", "Very High"]
    let durations = ["<3h", "6~10h", "10~20h", ">1day"]
    let types = ["Snowy", "Forest", "Volcano", "City"]
    let groupSizes = ["Solo", "Group", "Need a Guide"]

    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading){
                Text("Distance")
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 200, height: 1)
                    .padding(.bottom, 8)
                customHardPicker(items: distances, selectedIndex: $selectedDistance)
            }
            VStack(alignment: .leading){
                Text("Consumption")
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 200, height: 1)
                    .padding(.bottom, 8)
                customHardPicker(items: consumptions, selectedIndex: $selectedConsumption)
            }
            VStack(alignment: .leading){
                Text("Duration")
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 200, height: 1)
                    .padding(.bottom, 8)
                customHardPicker(items: durations, selectedIndex: $selectedDuration)
            }
            VStack(alignment: .leading){
                Text("Type")
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 200, height: 1)
                    .padding(.bottom, 8)
                customPicker(items: types, selectedIndex: $selectedType)
            }
            VStack(alignment: .leading){
                Text("Group Size")
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 200, height: 1)
                    .padding(.bottom, 8)
                customPicker(items: groupSizes, selectedIndex: $selectedGroupSize)
            }
            HStack{
                Spacer()
                NavigationStack{
                    NavigationLink{
                        FindDestinationView()
                    }label: {
                        Text("Go Exploring →")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(
                                Capsule()
                                    .foregroundColor(.white)
                                    .overlay(
                                        Capsule()
                                            .stroke(Color.red, lineWidth: 5)
                                    )
                            )
                            .foregroundColor(.red)
                    }
                }
                Spacer()
            }
        }
        .font(.title3)
        .padding(.leading, 10)
    }
    func customHardPicker(items: [String], selectedIndex: Binding<Int>) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(items.indices) { index in
                    Button(action: {
                        selectedIndex.wrappedValue = index
                    }) {
                        Text(items[index])
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(
                                        selectedIndex.wrappedValue == index
                                        ? (index == 0 ? .green : index == 1 ? .yellow :index == 2 ?  .red : .red)
                                            : .gray.opacity(0.4)
                                    )
                            )
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding(.bottom, 10)
    }

    func customPicker(items: [String], selectedIndex: Binding<Int>) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(items.indices) { index in
                    Button(action: {
                        selectedIndex.wrappedValue = index
                    }) {
                        Text(items[index])
                            .padding(.vertical, 8)
                            .padding(.horizontal, 12)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(selectedIndex.wrappedValue == index ? .blue : .gray.opacity(0.4))
                            )
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .padding(.bottom, 10)
    }
}



struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}

