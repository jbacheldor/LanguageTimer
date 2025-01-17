//
//  HomeView.swift
//  LanguageTime
//
//  Created by Jess  on 1/17/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selection: String = ""
    @State private var timeSelection: Int = 5
    let languages = ["Japanese", "Korean", "Urdu"]
    let times = [5, 10, 15]
    
    var body: some View {
        NavigationView {
        VStack{
            Text("Timer Quiz").padding()
            HStack {
                Text("Select a language: ")
                Picker("Select a Language", selection: $selection) {
                    ForEach(languages, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.menu)
            }.padding()
            
            HStack {
                Text("Select a Time: ")
                Picker("Select Time", selection: $timeSelection) {
                    ForEach(times, id: \.self){ time in
                        Text("\(time)").tag(time)
                    }
                }.pickerStyle(.menu)
            }.padding()
                NavigationLink{
                    QuizView()
                } label: {
                    Text("Start")
                }.foregroundColor(.black)
                .frame(width: 70.0, height: 40.0)
                .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
                .cornerRadius(15)
            }
        }
    }
}

#Preview {
    HomeView()
}
