//
//  HomeView.swift
//  LanguageTime
//
//  Created by Jess  on 1/17/25.
//

import SwiftUI

struct HomeView: View {
    @State private var selection: String = ""
    @State var timeSelection: Int = 5
    let languages = ["Japanese", "Korean", "Urdu"]
    let times = [5, 10, 15]
    var startAvailable: Bool = false
    
    var body: some View {
        NavigationView {
        VStack{
            Text("Timer Quiz").padding()
                .background(Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804))
                .cornerRadius(15)
            HStack {
                Text("Select a language: ")
                Picker("Select a Language", selection: $selection) {
                    ForEach(languages, id: \.self) {
                        Text($0)
                    }
                }.pickerStyle(.menu)
                    .tint(.black)
                    .background(Color(red: 0.9411764705882353, green: 0.9490196078431372, blue: 0.9058823529411765))
                    .cornerRadius(10)
            }.padding()
            
            HStack {
                Text("Select a Time: ")
                Picker("Select Time", selection: $timeSelection) {
                    ForEach(times, id: \.self){ time in
                        Text("\(time)").tag(time)
                    }
                }.pickerStyle(.menu)
                    .tint(.black)
                    .background(Color(red: 0.9411764705882353, green: 0.9490196078431372, blue: 0.9058823529411765))
                    .cornerRadius(10)
            }
                NavigationLink{
                    QuizView(minutes: self.$timeSelection) .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Start")
                        .padding()
                }
                .background(Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804))
                .cornerRadius(15)
                .padding()
                .disabled(selection != "" ?  false : true)
            }
        .foregroundColor(.black)
        .frame(width: 325, height: 300)
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
        }
    }
}

#Preview {
    HomeView()
}
