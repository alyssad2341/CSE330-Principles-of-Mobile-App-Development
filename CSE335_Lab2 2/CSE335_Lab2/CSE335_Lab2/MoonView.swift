//
//  MoonView.swift
//  CSE335_Lab2
//
//  Created by Alyssa Duranovic on 9/16/24.
//

import SwiftUI

struct MoonView: View {
    
    @Binding var dataFromFirst: String
    @Binding var dataFromSecond: String
    var earthWeight: Double
    var viewNumber:Int
    @Binding var path: NavigationPath

    var body: some View {
        
        VStack{
            Spacer()
            Text(dataFromFirst).foregroundColor(.green)
            Text("You are on the Moon")
            Image("moon")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            Text("Your weight on Earth is... \(earthWeight) lbs")
            Text("")
            Text("Your weight on Moon is... \(earthWeight*(1/6)) lbs")
            Spacer()
            Text("I feel much lighter!")
            Spacer()
            Button("Go to Earth") {
                dataFromSecond = "Coming from the moon."
                //dismiss()
                path.removeLast()
                    
            }
            
            Spacer()
            NavigationLink("Go to Jupiter", value: 3)
            Spacer()
        }
        .navigationTitle("MoonView")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MoonView(dataFromFirst: .constant(""), dataFromSecond: .constant(""), earthWeight: 0, viewNumber: 0, path: .constant(NavigationPath()))
}
