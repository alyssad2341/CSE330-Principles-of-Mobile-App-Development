//
//  ContentView.swift
//  CSE335_Lab2
//
//  Created by Alyssa Duranovic on 9/16/24.
//

import SwiftUI

struct ContentView: View {
    @State var weight: Double = 0.0
    @State private var path = NavigationPath()
    @State var dataFromSecond: String = ""
    @State var dataFromFirst: String = ""
    
    var body: some View {
        let numberFormatter: NumberFormatter = {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.minimumFractionDigits = 0
            formatter.minimumIntegerDigits = 1
            return formatter
        }()
        
            NavigationStack(path: $path) {
                VStack {
                    Spacer()
                    Text("Welcome to Space Walk App")
                    Text("")
                    Text(dataFromSecond).foregroundColor(.green)
                    Text("")
                    Text("You are on Earth Now")
                    Spacer()
                    Spacer()
                    HStack{
                        Text("Enter your weight (lb): " )
                        TextField("enter here (in pounds)", value: $weight, formatter: numberFormatter).keyboardType(.decimalPad)
                    }
                    Spacer()
                    Image("earth")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding()
                    Spacer()
                }
                Spacer()

                NavigationLink("Go to Moon", value: 2)
                
                .navigationDestination(for: Int.self) { numberValue in
                    if numberValue == 2
                    {
                        MoonView(dataFromFirst: $dataFromFirst, dataFromSecond: $dataFromSecond, earthWeight:
                            weight, viewNumber: 2, path: $path)
                    }else
                    {
                        JupiterView(dataFromFirst: $dataFromFirst, dataFromSecond: $dataFromSecond, earthWeight: weight, viewNumber: 3, path: $path)
                    }
                    }
                Spacer()
            }
            .navigationTitle("ContentView")
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            
        }
}

#Preview {
    ContentView(dataFromSecond: " ")
}
