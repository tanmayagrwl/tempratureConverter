//
//  ContentView.swift
//  tempratureConverter
//
//  Created by Tanmay Agrawal on 16/11/24.
//
import SwiftUI

struct ContentView: View {
    @State private var inputTemp = 0.0
    @State private var inputTemperatureFormat = "K"
    @State private var outputTemperatureFormat = "K"
    let typesOfTemp = ["°F", "°C", "K"]
    
    // Function to convert temperatures
    private func convertTemperature() -> Double {
        // First convert to Fahrenheit as an intermediate step
        let fahrenheit: Double
        
        switch inputTemperatureFormat {
        case "°C":
            fahrenheit = inputTemp * 9/5 + 32
        case "K":
            fahrenheit = (inputTemp * 9/5) - 459.67
        default: // °F
            fahrenheit = inputTemp
        }
        
        // Convert from Fahrenheit to target temperature
        switch outputTemperatureFormat {
        case "°C":
            return (fahrenheit - 32) * 5/9
        case "K":
            return (fahrenheit + 459.67) * 5/9
        default: // °F
            return fahrenheit
        }
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter Temperature") {
                    TextField("Enter Temperature", value: $inputTemp, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Input Format", selection: $inputTemperatureFormat) {
                        ForEach(typesOfTemp, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Converted Temperature") {
                    Text(convertTemperature().formatted(.number.precision(.fractionLength(2))) + " " + outputTemperatureFormat)
                    
                    Picker("Output Format", selection: $outputTemperatureFormat) {
                        ForEach(typesOfTemp, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Temperature Converter")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
