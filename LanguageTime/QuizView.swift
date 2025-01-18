//
//  QuizView.swift
//  LanguageTime
//
//  Created by Jess  on 1/17/25.
//

import SwiftUI

struct QuizView: View {
    @State var answer : String = ""
    @Binding var minutes: Int
    @State private var answersDict: [String : String] = [:]
    @State var time: String = "00:00 AM"
    
    func generateRandomTime() {
        let minutes = NSNumber(value: Int.random(in: 1...59)).intValue
        let hours = NSNumber(value: Int.random(in: 1...12)).intValue
        let timeSuffix = Bool.random() ? "PM" : "AM"
        time = String(format: "%02i:%02i \(timeSuffix)", hours, minutes)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 20) {
                    NavigationLink{
                        HomeView()                       .navigationBarBackButtonHidden(true)
                    } label : {
                        Text("Home")
                    }.foregroundColor(.black)
                        .padding(.top, 2.0)
                        .padding(.leading, 10.0)
                        .navigationBarBackButtonHidden(true)
                    Spacer()
                    NavigationLink{
                        HomeView()                    .navigationBarBackButtonHidden(true)
                    } label : {
                        Text("Settings")
                    }.foregroundColor(.black)
                        .padding(.top, 2.0)
                        .padding(.trailing, 10.0)
                }
                .padding()
                .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
                .cornerRadius(25)
                .shadow(color: Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804), radius: 5, x: 5, y: 5)
                .padding(.horizontal).padding([.bottom], 10)
                //            HeaderView2().padding(.horizontal).padding([.bottom], 10)
                TimerView(minutes: self.$minutes)
                    .padding([.bottom], 10)
                VStack {
                    Text("What time is it?").padding([.top], 15)
                    Text("\(time)")
                    Image("ClockFace")
                        .resizable()
                        .frame(width: 300, height: 300)
                }
                .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
                .cornerRadius(25)
                .shadow(color: Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804), radius: 5, x: 5, y: 5)
                .padding([.vertical], 5)
                //        input box
                VStack(spacing: 20) {
                    VStack{
                        TextField("answer here", text: $answer).padding()
                        //                Text(answer)
                    }
                    .frame(width: 300.0, height: 75.0)
                    .background(Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804))
                    .cornerRadius(25)
                    Button("Submit"){
                        answersDict["test"] = answer
                        answer = ""
                        generateRandomTime()
                    }
                        .frame(width: 100.0, height: 50.0)
                        .foregroundColor(.black)
                        .background(Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804))
                        .cornerRadius(25)
                }
                .padding()
                .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
                .cornerRadius(25)
                .shadow(color: Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804), radius: 5, x: 5, y: 5)
                GameNavigation()
            }
        }
}

        
}
#Preview {
    @State @Previewable var minutes: Int = 1
    return QuizView(minutes: $minutes)
}
