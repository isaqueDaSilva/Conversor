//
//  ContentView.swift
//  Conversor
//
//  Created by Isaque da Silva on 18/06/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var typeChoice: TypeOfConversion = .lenght
    @State private var inputValueSubtype = "Meter"
    @State private var outputValueOfSubtype = "Centimeter"
    @State private var valueToBeConverted: Double = 0
    @FocusState private var isFoucused: Bool
    
    var subtypesOfConversion: [String] {
        var subtypes = [String]()
        
        switch typeChoice {
        case.lenght:
            subtypes = ["Millimeter", "Centimeter", "Meter", "Kilometer"]
        case .temperature:
            subtypes = ["Celsius", "Kelvin", "Fahrenheit"]
        case .time:
            subtypes = ["Seconds", "Minutes", "Hours", "Days"]
        case .volume:
            subtypes = ["Milliliters", "Liters", "Cubic meter"]
        }
        
        return subtypes
    }
    
    var conversion: String {
        var result = "\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted)"
        
        // Lenght
        if inputValueSubtype == "Millimeter" && outputValueOfSubtype == "Centimeter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 10)")
        } else if inputValueSubtype == "Millimeter" && outputValueOfSubtype == "Meter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is\(valueToBeConverted / 1_000)")
        } else if inputValueSubtype == "Millimeter" && outputValueOfSubtype == "Kilometer" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 1_000_000)")
        } else if inputValueSubtype == "Centimeter" && outputValueOfSubtype ==  "Millimeter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 10)")
        } else if inputValueSubtype == "Centimeter" && outputValueOfSubtype == "Meter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 100)")
        } else if inputValueSubtype == "Centimeter" && outputValueOfSubtype == "Kilometer" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 100_000)")
        } else if inputValueSubtype == "Meter" && outputValueOfSubtype ==  "Millimeter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 1_000)")
        } else if inputValueSubtype == "Meter" && outputValueOfSubtype == "Centimeter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 100)")
        } else if inputValueSubtype == "Meter" && outputValueOfSubtype == "Kilometer" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 1_000)")
        } else if inputValueSubtype == "Kilometer" && outputValueOfSubtype ==  "Millimeter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 1_000_000)")
        } else if inputValueSubtype == "Kilometer" && outputValueOfSubtype == "Centimeter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 100_000)")
        } else if inputValueSubtype == "Kilometer" && outputValueOfSubtype == "Meter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 1000)")
        }
        
        // Temperature
        if inputValueSubtype == "Celsius" && outputValueOfSubtype ==  "Kelvin" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted + 273.15)")
        } else if inputValueSubtype == "Celsius" && outputValueOfSubtype == "Fahrenheit" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 9 / 5 + 32)")
        } else if inputValueSubtype == "Kelvin" && outputValueOfSubtype == "Celsius" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted - 273.15)")
        } else if inputValueSubtype == "Kelvin" && outputValueOfSubtype ==  "Fahrenheit" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \((valueToBeConverted - 273.15) * 9 / 5 + 32)")
        } else if inputValueSubtype == "Fahrenheit" && outputValueOfSubtype == "Celsius" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \((valueToBeConverted - 32) * 5 / 9)")
        } else if inputValueSubtype == "Fahrenheit" && outputValueOfSubtype == "Kelvin" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \((valueToBeConverted - 32) + 273.15)")
        }
        
        // Time
        if inputValueSubtype == "Seconds" && outputValueOfSubtype == "Minutes" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 60)")
        } else if inputValueSubtype == "Seconds" && outputValueOfSubtype == "Hours" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 3_600)")
        } else if inputValueSubtype == "Seconds" && outputValueOfSubtype == "Days" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 86_400)")
        } else if inputValueSubtype == "Minutes" && outputValueOfSubtype == "Seconds" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 60)")
        } else if inputValueSubtype == "Minutes" && outputValueOfSubtype == "Hours" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 3_600)")
        } else if inputValueSubtype == "Minutes" && outputValueOfSubtype == "Days" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 86_400)")
        } else if inputValueSubtype == "Hours" && outputValueOfSubtype == "Seconds" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 3_600)")
        } else if inputValueSubtype == "Hours" && outputValueOfSubtype == "Minutes" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 60)")
        } else if inputValueSubtype == "Hours" && outputValueOfSubtype == "Days" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 24)")
        } else if inputValueSubtype == "Days" && outputValueOfSubtype == "Seconds" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 86_400)")
        } else if inputValueSubtype == "Days" && outputValueOfSubtype == "Minutes" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 1_440)")
        } else if inputValueSubtype == "Days" && outputValueOfSubtype == "Hours" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 24)")
        }
        
        // Volume
        if inputValueSubtype == "Milliliters" && outputValueOfSubtype == "Liters" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 1_000)")
        } else if inputValueSubtype == "Milliliters" && outputValueOfSubtype == "Cubic meter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 1_000_000)")
        } else if inputValueSubtype == "Liters" && outputValueOfSubtype == "Milliliters" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 1_000)")
        } else if inputValueSubtype == "Liters" && outputValueOfSubtype == "Cubic meter" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted / 1_000)")
        } else if inputValueSubtype == "Cubic meter" && outputValueOfSubtype == "Milliliters" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 1_000_000)")
        } else if inputValueSubtype == "Cubic meter" && outputValueOfSubtype == "Liters" {
            result = ("\(valueToBeConverted) \(inputValueSubtype) in \(outputValueOfSubtype) is \(valueToBeConverted * 1_000)")
        }
        
        return result
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Type of Conversion", selection: $typeChoice) {
                        ForEach(TypeOfConversion.allCases, id: \.self) {
                            Text($0.rawValue.capitalized)
                        }
                    }
                }
                
                Section {
                    TextField("Value", value: $valueToBeConverted, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFoucused)
                } header: {
                    Text("Enter the value to be converted:")
                }
                
                Section{
                    Picker("Choice", selection: $inputValueSubtype) {
                        ForEach(subtypesOfConversion, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("From:")
                }
                
                Section{
                    Picker("Choice", selection: $outputValueOfSubtype) {
                        ForEach(subtypesOfConversion, id: \.self) {
                            Text($0)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("To:")
                }
                
                Text(conversion)
                    .listRowBackground(Color(CGColor(red: 240, green: 240, blue: 246, alpha: 0)))
                    .bold()
                    .foregroundColor(.gray)
                    .frame(width: 300)
            }
            .navigationTitle("Conversor")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        isFoucused = false
                    }
                }
            }
        }
    }
}
    

enum TypeOfConversion: String, CaseIterable {
    case lenght, temperature, time, volume
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
