//
//  ContentView.swift
//  Mult-Selection Demo
//
//  Created by Tadreik Campbell on 7/29/23.
//

import SwiftUI

struct ContentView: View {
    
    var options: [String] = ["Option 1", "Option 2", "Option 3"]
    @State var selectedOptions: [String] = []
    
    var body: some View {
        VStack {
            ForEach(options, id: \.self) { option in
                MyButton(arrayToAddValueTo: $selectedOptions, value: option)
            }
        }
        .padding()
    }
}

struct MyButton: View {
    @Binding var arrayToAddValueTo: [String]
    @State private var isSelected = false
    var value: String
    
    var body: some View {
        Text(value)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? .green : .green.opacity(0.5))
            }
            .onTapGesture {
                isSelected.toggle()
                if isSelected {
                    arrayToAddValueTo.append(value)
                } else {
                    if let index = arrayToAddValueTo.firstIndex(of: value) {
                        arrayToAddValueTo.remove(at: index)
                    }
                }
                print(arrayToAddValueTo)
            }
    }
}

#Preview {
    ContentView()
}
