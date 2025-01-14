//
//  ContentView.swift
//  LanguageTime
//
//  Created by Jess  on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var answer: String = ""
    var body: some View {
        var answer: String
        HStack(spacing: 20) {
            Button("Home"){
            }.foregroundColor(.black)
            Button("Settings"){
                
            }.foregroundColor(.black)
        }
        .padding()
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
        
        HStack(spacing: 20) {
            Text("Timer").foregroundColor(.black)
        }
        .padding()
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
        HStack(spacing: 20) {
            Text("What time is it?")
        }
        .padding()
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
//        input box
        VStack(spacing: 20) {
            Text("need a wee little box here")
            VStack{
                TextField("answer here", text: $answer)
//                Text(answer)
            }
            .frame(width: 200.0, height: 200.0)
            .background(Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804))
            .cornerRadius(25)
            Button("Submit"){}
                .frame(width: 100.0, height: 50.0)
                .foregroundColor(.black)
                .background(Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804))
                .cornerRadius(25)
        }
        .padding()
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
    }
}

#Preview {
    ContentView()
}
