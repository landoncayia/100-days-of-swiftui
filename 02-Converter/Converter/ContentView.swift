//
//  ContentView.swift
//  Converter
//
//  Created by Landon Cayia on 6/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var unitChoice = "Temp"
    @State private var fromTemp = "Celsius"
    @State private var toTemp = "Fahrenheit"
    @State private var inputTemp = 0.0
    @FocusState private var inputIsFocused: Bool
    
    private var outputTemp: Double {
        switch (fromTemp, toTemp) {
        case ("Celsius", "Fahrenheit"):
            return inputTemp * (9 / 5) + 32
        case ("Celsius", "Kelvin"):
            return inputTemp + 273.15
        case ("Fahrenheit", "Celsius"):
            return (inputTemp - 32) * (5 / 9)
        case ("Fahrenheit", "Kelvin"):
            return (inputTemp - 32) * (5 / 9) + 273.15
        case ("Kelvin", "Fahrenheit"):
            return (inputTemp - 273.15) * (9 / 5) + 32
        case ("Kelvin", "Celsius"):
            return inputTemp - 273.15
        default:
            return 0
        }
    }
    
    let unitOptions = ["Temp", "Length", "Time", "Volume"]
    let tempOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Convert from unit", selection: $fromTemp) {
                        ForEach(tempOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Input value", value: $inputTemp, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($inputIsFocused)
                } header: {
                    Text("Convert from unit")
                }
                
                Section {
                    Picker("Convert to unit", selection: $toTemp) {
                        ForEach(tempOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(outputTemp, format: .number)
                } header: {
                    Text("Convert to unit")
                }
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
