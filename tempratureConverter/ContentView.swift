//
//  ContentView.swift
//  tempratureConverter
//
//  Created by Tanmay Agrawal on 16/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var inputTemp = 0.0
    @State private var inputTempratureFormat = "K"
    @State private var outputTempratureFormat = "K"
    @State private var middleTemp = 0.0
    let typesOfTemp = ["°F","°C", "K"]

    var body: some View {
        var outputTemp:Double{
            if(inputTempratureFormat == "°C" ){
                middleTemp = inputTemp*1.8 + 32
            } else if(inputTempratureFormat == "K"){
                middleTemp = (inputTemp - 273.15 ) * 1.8 + 32
            } else {
                middleTemp = inputTemp
            }
            
            if(outputTempratureFormat == "°C"){
               return (middleTemp - 32) * 5/9
            } else if (outputTempratureFormat == "K"){
                return (middleTemp + 459.67) * 5/9
            } else {
                return middleTemp
            }
        }
        
        NavigationStack{
            Form{
                Section("Enter current Temprature"){
                    TextField("Enter Temprature", value: $inputTemp, format: .number).keyboardType(.decimalPad)
                    
                    Picker("Temprature", selection: $inputTempratureFormat){
                        ForEach(typesOfTemp, id: \.self){
                            Text($0)
                        }
                    }.pickerStyle(.palette)
                }
                Section("Converted Temprature"){
                    Text(outputTemp, format: .number)
                    Picker("Temprature", selection: $outputTempratureFormat){
                        ForEach(typesOfTemp, id:\.self){
                            Text($0)
                        }
                    }                }
                .pickerStyle(.palette)
            }
            
            .navigationTitle("Temprature Converter").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
