//
//  ContentView.swift
//  Unit Converter
//
//  Created by manan jain on 30/01/23.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue = 0.0
    @FocusState private var amountIsFocused : Bool
    @State private var selectedInputUnit = "meters"
    let inputUnits = ["meters", "kilometers", "feet", "yards","miles"]
    
    @State private var selectedOutputUnit = "kilometers"
    let outputUnits = ["meters", "kilometers", "feet", "yards", "miles"]

    var conversion: Double{
        var convetedVal: Double?
        if(selectedInputUnit == "meters"){
            convetedVal = inputValue
        }
        else if(selectedInputUnit == "kilometers"){
            convetedVal = inputValue*1000
        }
        else if(selectedInputUnit == "feet"){
            convetedVal =  inputValue*0.3048
        }
        else if(selectedInputUnit == "yards"){
            convetedVal =  inputValue*0.9144
        }
        else if(selectedInputUnit == "miles"){
            convetedVal =  inputValue*1609.34
        }
        
        return  Double(convetedVal!)

    }
    
    var returnVal: Double{
        var outputVal:Double?
        
        if(selectedOutputUnit == "meters"){
            outputVal = conversion
        }
        else if(selectedOutputUnit == "kilometers"){
            outputVal = conversion*0.001
        }
        else if(selectedOutputUnit == "feet"){
            outputVal =  conversion*3.28084
        }
        else if(selectedOutputUnit == "yards"){
            outputVal =  conversion*1.09361
        }
        else if(selectedOutputUnit == "miles"){
            outputVal =  conversion*0.000621371
        }
        
        return  Double(outputVal!)
    }
    

    
    var body: some View {
        NavigationView {
            Form{
                
                Section{ TextField("Enter the amount", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    
                } header: {
                    Text("Enter your input value")
                }
                
                Section{
                    Picker("Select your unit", selection: $selectedInputUnit, content: {
                        ForEach(inputUnits, id: \.self){
                            Text("\($0)")
                        }
                    })  .pickerStyle(.segmented)
                    
                    
                }header:{
                    Text("Select your input unit")
                }
                
                Section{
                    
                    Picker("Select your output unit", selection: $selectedOutputUnit, content: {
                        ForEach(outputUnits, id: \.self){
                            Text($0)
                        }
                    }).pickerStyle(.segmented)
                }
              
            header:{
                Text("Select your input unit")
            }
                
                
                Section{
                    Text(returnVal, format: .number)
                    
                }
                
            }.navigationTitle("Unit Conversion")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
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
