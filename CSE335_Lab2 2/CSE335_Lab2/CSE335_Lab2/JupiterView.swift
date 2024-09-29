//
//  JupiterView.swift
//  CSE335_Lab2
//
//  Created by Alyssa Duranovic on 9/18/24.
//

import SwiftUI

struct JupiterView: View {
    @Binding var dataFromFirst: String
    @Binding var dataFromSecond: String
    var earthWeight: Double
    var viewNumber:Int
    @Binding var path: NavigationPath

    var body: some View {
        
        VStack{
            Spacer()
            Text("You are on Jupiter")
            Image("jupiter")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            Text("Your weight on Earth is... \(earthWeight) lbs")
            Text("")
            Text("Your weight on Moon is... \(earthWeight*(1/6))")
            Text("")
            Text("Your weight on Jupiter is... \(earthWeight*(2.4)) lbs")
            Spacer()
            Text("I feel heavier!")
            Spacer()
            Button("Go to Earth") {
                dataFromSecond = "Coming from the Jupiter."
                //dismiss()
                path.removeLast()
                path.removeLast()
                    
            }
            Spacer()
            Button("Go to Moon") {
                dataFromFirst = "Coming from the Jupiter."
                //dismiss()
                path.removeLast()
                    
            }
            Spacer()
        }
        .navigationTitle("JupiterView")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    JupiterView(dataFromFirst: .constant(""), dataFromSecond: .constant(""), earthWeight: 0, viewNumber: 0, path: .constant(NavigationPath()))
}

