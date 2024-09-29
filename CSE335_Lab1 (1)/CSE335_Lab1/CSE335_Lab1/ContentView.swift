//
//  ContentView.swift
//  CSE335_Lab1
//
//  Created by Alyssa Duranovic on 9/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var height: Double = 0
    @State var weight: Double = 0
    @State var waist: Double = 0
    @State var bmi: Double = 0
    @State var greeting: String = ""
    @State var buttonPressed = false
    
    @State var val: Double = 0
    
    var body: some View {
        
        
        VStack {
            
            Spacer()
            
            Text("BMI and Disease Risk Calculator")
            
            Spacer()
            
            HStack{
                Text("Height (in): " )
                Spacer()
                Spacer()
                TextField("enter here (in inches)", text: Binding(
                    get: {String(height)},
                    set: {val in
                        if let value = Double(val){
                            height = value
                        }
                    }
                ))
            }
            
            HStack{
                Text("Weight (lb): " )
                Spacer()
                Spacer()
                TextField("enter here (in pounds)", text: Binding(
                    get: {String(weight)},
                    set: {val in
                        if let value = Double(val){
                            weight = value
                        }
                    }
                ))
            }
            
            HStack{
                Text("Waist Circumference (in): " )
                Spacer()
                Spacer()
                TextField("enter here (in inches)", text: Binding(
                    get: {String(waist)},
                    set: {val in
                        if let value = Double(val){
                            waist = value
                        }
                    }
                ))
            }
            
            Spacer()
            
            Button(action: {
                buttonPressed = true
                self.bmi = weight/pow(height, 2)*703
                self.greeting = "\(self.bmi)"
                
            }) {
                Text("Determine Risk")
            }.alert("BMI = \(greeting)", isPresented: $buttonPressed){
                Button("OK"){}
            }message: {
                if bmi < 18.5{
                    Text("Underweight")
                }else if (bmi >= 18.5) && (bmi < 25){
                    Text("Normal")
                }else if (bmi >= 25) && (bmi < 30){
                    Text("Overweight")
                }else if (bmi >= 30) && (bmi < 40){
                    Text("Obesity")
                }else if (bmi >= 40){
                    Text("Extreme Obesity")
                }
            }
            
            Spacer()
            
            Text("Disease Risk:")
            if bmi < 18.5{
                Text("No Risk")
            }else if (bmi >= 18.5) && (bmi < 25){
                Text("No Risk")
            }else if (bmi >= 25) && (bmi < 30){
                HStack{
                    Spacer()
                    Text("Woman: ")
                    if waist<=35{
                        Text("Increased").foregroundColor(.yellow)
                    }else if waist>35{
                        Text("High").foregroundColor(.purple)
                    }
                    
                    Spacer()
                    
                    Text("Man: ")
                    if waist<=40{
                        Text("Increased").foregroundColor(.yellow)
                    }else if waist>40{
                        Text("High").foregroundColor(.purple)
                    }
                    Spacer()
                }
            }else if (bmi >= 30) && (bmi < 35){
                HStack{
                    Spacer()
                    Text("Woman: ")
                    if waist<=35{
                        Text("High").foregroundColor(.purple)
                    }else if waist>35{
                        Text("Very High").foregroundColor(.orange)
                    }
                    
                    Spacer()
                    
                    Text("Man: ")
                    if waist<=40{
                        Text("High").foregroundColor(.purple)
                    }else if waist>40{
                        Text("Very High").foregroundColor(.orange)
                    }
                    Spacer()
                }
            }else if (bmi >= 35) && (bmi < 40){
                Text("Very High").foregroundColor(.orange)
            }else if (bmi >= 40){
                Text("Extremely High").foregroundColor(.red)
            }
            
            Spacer()
            
            
        }.padding()
    }
}

struct show : View
{
    @State var height: Double = 0
    @State var weight: Double = 0
    @State var waist: Double = 0
    @State var bmi: Double = 0
    @State var greeting: String = ""
    @State var buttonPressed = false
    
    @State var val: Double = 0
    
    var body: some View {
        
        
        VStack {
            
            Spacer()
            
            Text("BMI and Disease Risk Calculator")
            
            Spacer()
            
            HStack{
                Text("Height (in): " )
                Spacer()
                Spacer()
                TextField("enter here (in inches)", text: Binding(
                    get: {String(height)},
                    set: {val in
                        if let value = Double(val){
                            height = value
                        }
                    }
                ))
            }
            
            HStack{
                Text("Weight (lb): " )
                Spacer()
                Spacer()
                TextField("enter here (in pounds)", text: Binding(
                    get: {String(weight)},
                    set: {val in
                        if let value = Double(val){
                            weight = value
                        }
                    }
                ))
            }
            
            HStack{
                Text("Waist Circumference (in): " )
                Spacer()
                Spacer()
                TextField("enter here (in inches)", text: Binding(
                    get: {String(waist)},
                    set: {val in
                        if let value = Double(val){
                            waist = value
                        }
                    }
                ))
            }
            
            Spacer()
            
            Button(action: {
                buttonPressed = true
                self.bmi = weight/pow(height, 2)*703
                self.greeting = "\(self.bmi)"
                
            }) {
                Text("Determine Risk")
            }.alert("BMI = \(greeting)", isPresented: $buttonPressed){
                Button("OK"){}
            }message: {
                if bmi < 18.5{
                    Text("Underweight")
                }else if (bmi >= 18.5) && (bmi < 25){
                    Text("Normal")
                }else if (bmi >= 25) && (bmi < 30){
                    Text("Overweight")
                }else if (bmi >= 30) && (bmi < 40){
                    Text("Obesity")
                }else if (bmi >= 40){
                    Text("Extreme Obesity")
                }
            }
            
            Spacer()
            
            Text("Disease Risk:")
            if bmi < 18.5{
                Text("No Risk")
            }else if (bmi >= 18.5) && (bmi < 25){
                Text("No Risk")
            }else if (bmi >= 25) && (bmi < 30){
                HStack{
                    Spacer()
                    Text("Woman: ")
                    if waist<=35{
                        Text("Increased").foregroundColor(.yellow)
                    }else if waist>35{
                        Text("High").foregroundColor(.purple)
                    }
                    
                    Spacer()
                    
                    Text("Man: ")
                    if waist<=40{
                        Text("Increased").foregroundColor(.yellow)
                    }else if waist>40{
                        Text("High").foregroundColor(.purple)
                    }
                    Spacer()
                }
            }else if (bmi >= 30) && (bmi < 35){
                HStack{
                    Spacer()
                    Text("Woman: ")
                    if waist<=35{
                        Text("High").foregroundColor(.purple)
                    }else if waist>35{
                        Text("Very High").foregroundColor(.orange)
                    }
                    
                    Spacer()
                    
                    Text("Man: ")
                    if waist<=40{
                        Text("High").foregroundColor(.purple)
                    }else if waist>40{
                        Text("Very High").foregroundColor(.orange)
                    }
                    Spacer()
                }
            }else if (bmi >= 35) && (bmi < 40){
                Text("Very High").foregroundColor(.orange)
            }else if (bmi >= 40){
                Text("Extremely High").foregroundColor(.red)
            }
            
            Spacer()
            
            
        }.padding()
    }
}

#Preview {
    ContentView()
}
