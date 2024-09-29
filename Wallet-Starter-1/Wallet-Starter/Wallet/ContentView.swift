//
//  ContentView.swift
//  Wallet
//
//  Created by Alyssa Duranovic on 9/25/24.
//

import SwiftUI

struct ContentView: View {
    @State var myCard = CardDetails()
    @State private var cardNumber: String = ""
    @State private var rawNumber: String = ""
    @State private var secureCode: String = ""
    @State private var cardType: String = "VISA"
    @State private var showInfo = false
    @State private var name: String = ""
    @State private var bank: String = ""
    @State private var date = Date()
    @State private var cardColor: String = "Black"
   
    
    let cards = ["VISA", "Mastercard", "Amex", "Discover"]
    let colors = ["Black", "Blue", "Red", "Green"]
    
    var body: some View {
        
        VStack{
            Text("Add Card").font(.largeTitle)
            
            
            Form {
                
                
                Section("Signaure")
                {
                    TextField("Card Holder Name", text: $name)
                    TextField("Bank", text: $bank)
                    Picker("Card Type", selection: $cardType) {
                        ForEach(cards, id: \.self) { card in
                            Text(card).tag(card)
                        }
                    }.pickerStyle(.automatic)
                }
                
                
                Section("Details") {
                    TextField("Card Number", text: $cardNumber).onChange(of: cardNumber) { newValue in
                        let filtered = newValue.filter { "0123456789".contains($0) }
                        rawNumber = filtered

                        if filtered.count > 16 {
                            rawNumber = String(filtered.prefix(16))
                        }
                        cardNumber = formatNumber(rawNumber)
                    }
                    
                    TextField("Secure Code", text: $secureCode).onChange(of: secureCode) { newValue in
                        let filtered2 = newValue.filter { "0123456789".contains($0) }
                        secureCode = filtered2

                        if filtered2.count > 3 {
                            secureCode = String(filtered2.prefix(3))
                        }
                    }
                    
                    
                    DatePicker("Valid Through", selection: $date, displayedComponents: .date).datePickerStyle(.compact)
                    
                    Picker("Card Color", selection: $cardColor) {
                        ForEach(colors, id: \.self) { color in
                            Text(color).tag(color)
                        }
                    }.pickerStyle(.automatic)
                    
                }
                
                Button("Add Card to Wallet") {
                    
                    myCard.holderName = name
                    myCard.bank = bank
                    myCard.number = cardNumber
                    myCard.validity = date
                    myCard.secureCode = secureCode
                    
                    if(cardColor == "Black"){
                        myCard.color = Colors.black
                    }else if(cardColor == "Blue"){
                        myCard.color = Colors.blue
                    }else if(cardColor == "Red"){
                        myCard.color = Colors.red
                    }else if(cardColor == "Green"){
                        myCard.color = Colors.green
                    }
                    
                    if(cardType == "VISA"){
                        myCard.type = .visa
                    }else if(cardType == "Mastercard"){
                        myCard.type = .mastercard
                    }else if(cardType == "Amex"){
                        myCard.type = .amex
                    }else if(cardType == "Discover"){
                        myCard.type = .discover
                    }
                }
        
                Button("Show Info") {
                
                    showInfo = true
                }
    
                
            }
            .sheet(isPresented: $showInfo) {
                ZStack{
                    Rectangle().fill(myCard.color).frame(width: 350, height: 200).cornerRadius(10)
                    
                    VStack{
                        HStack{
                            Spacer()
                            Text(myCard.bank).foregroundColor(.white).font(.largeTitle)
                            Spacer()
                            Spacer()
                            Spacer()
                            Text(myCard.type.rawValue).foregroundColor(.white)
                            Spacer()
                        }
                        Text("")
                        Text("")
                        Text("")
                        Text("")
                        HStack{
                            Text("         ")
                            Text(myCard.holderName).foregroundColor(.white).bold()
                            Spacer()
                        }
                        HStack{
                            Text("         ")
                            Text("Valid Thru: \(myCard.formattedValidity)").foregroundColor(.white)
                            Text("   ")
                            Text("Secure Code: \(myCard.secureCode)").foregroundColor(.white)
                            Spacer()
                        }
                        HStack{
                            Text("         ")
                            Text(myCard.number).foregroundColor(.white).bold()
                            Spacer()
                        }
                        
                        
                    }
                        
                        
                }
                
            }
            
        }
    }
    func formatNumber(_ string: String) -> String {
        var formatted = string
        if string.count > 4 {
            formatted.insert(" ", at: formatted.index(formatted.startIndex, offsetBy: 4))
        }
        if string.count > 8 {
            formatted.insert(" ", at: formatted.index(formatted.startIndex, offsetBy: 9))
        }
        if string.count > 12 {
            formatted.insert(" ", at: formatted.index(formatted.startIndex, offsetBy: 14))
        }
        return formatted
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
