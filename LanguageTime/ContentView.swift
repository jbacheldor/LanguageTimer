//
//  ContentView.swift
//  LanguageTime
//
//  Created by Jess  on 1/8/25.
//

import SwiftUI

struct ContentView: View {
    @State var answer : String = ""
    @State private var min : Double = 15.0
//    let answer: String
    
    var body: some View {
        HeaderView().padding(.horizontal)
        TimerView(min: self.$min)
        HStack(spacing: 20) {
            Text("What time is it?")
        }
        .padding()
        .frame(width: 250.0, height: 200.0)
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
        
//        input box
        VStack(spacing: 20) {
            VStack{
                TextField("answer here", text: $answer).padding()
//                Text(answer)
            }
            .frame(width: 200.0, height: 100.0)
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
