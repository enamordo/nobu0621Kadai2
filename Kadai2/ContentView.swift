//
//  ContentView.swift
//  Kadai2
//
//  Created by nobu0621 on 2024/07/10.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber1: String = ""
    @State private var inputNumber2: String = ""
    @State private var result: String = "Label"
    
    @State private var selectedSign = CalculationSigns.plus

    init() {
            // 背景色
        UISegmentedControl.appearance().backgroundColor = UIColor(Color.brown.opacity(0.1))
            // 選択項目の背景色
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(Color.red)
            // 選択項目の文字色
            UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        }
    
    var body: some View {
        VStack {
            TextField("", text: $inputNumber1)
            TextField("", text: $inputNumber2)
            Picker("calculationSigns", selection: $selectedSign) {
                ForEach(CalculationSigns.allCases) {
                    Text($0.rawValue).tag($0)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            Button("Button") {
                
            }
            HStack {
                Label(result, systemImage: "bolt.fill").labelStyle(.titleOnly)
                Spacer()
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        Spacer()
    }
}

private enum CalculationSigns: String, CaseIterable, Identifiable {
    case plus = "+"
    case minus = "-"
    case multiplied = "×"
    case divided = "÷"

    var id: String { rawValue }
}

#Preview {
    ContentView()
}
