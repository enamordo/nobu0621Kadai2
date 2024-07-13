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
                let number1 = Float(inputNumber1) ?? 0
                let number2 = Float(inputNumber2) ?? 0
                switch selectedSign {
                case .plus:
                    result = String(number1 + number2)
                case .minus:
                    result = String(number1 - number2)
                case .multiplied:
                    result = String(number1 * number2)
                case .divided:
                    if number2 == 0 {
                        result = "割る数には0以外を入力して下さい"
                    } else {
                        result = String(number1 / number2)
                    }
                }
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
