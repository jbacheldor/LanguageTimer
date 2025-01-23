//
//  QuizView.swift
//  LanguageTime
//
//  Created by Jess  on 1/17/25.
//

import SwiftUI

struct QuizView: View {
    @State var answer : String = ""
    @Binding var timerMinutes: Int
    @State private var answersDict: [String : String] = [:]
    @State var time: String = "00:00 AM"
    @State var minutes: Int = 0
    @State var hours: Int = 0
    
    var enabledButtonColor = Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804)
    var disabledButtonColor = Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804, opacity: 0.305)
    
    func generateRandomTime() {
        minutes = NSNumber(value: Int.random(in: 1...59)).intValue
        hours = NSNumber(value: Int.random(in: 1...12)).intValue
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
                TimerView(minutes: self.$timerMinutes)
                    .padding([.bottom], 10)
                VStack {
                    Text("What time is it?").padding([.top], 15)
                    Text("\(time)")
                    Clock(timeInput: self.$time, minuteHand: self.$minutes,  hourHand: self.$hours)
                    
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
                    HStack{
                        Button("Submit"){
                            answersDict[time] = answer
                            answer = ""
                            generateRandomTime()
                        }
                            .frame(width: 100.0, height: 50.0)
                            .foregroundColor(.black)
                            .background(answer != "" ? enabledButtonColor : disabledButtonColor)
                            .cornerRadius(25)
                            .disabled(answer.isEmpty)
                        Button("Skip"){
                            answersDict[time] = ""
                            answer = ""
                            generateRandomTime()
                        }
                            .frame(width: 100.0, height: 50.0)
                            .foregroundColor(.black)
                            .background(Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804))
                            .cornerRadius(25)
                    }
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

struct Clock: View {
    @Binding var timeInput: String
    @Binding var minuteHand: Int
    @Binding var hourHand: Int
    
    var primaryColor = Color(red: 0.7607843137254902, green: 0.9215686274509803, blue: 0.9647058823529412)
    var secondColor = Color(red: 0.7607843137254902, green: 0.8196078431372549, blue: 0.9647058823529412)
    var accentColor = Color(red: 0.611764705882353, green: 0.6549019607843137, blue: 0.7803921568627451)
    
    
    var body: some View {
        ZStack{
            Circle()
                .fill(primaryColor)
                .frame(width: 200, height: 200)
                .shadow(color: Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804), radius: 5, x: 5, y: 5)
            Circle()
                .fill(accentColor)
                .frame(width: 15, height: 15)
            ClockFace().stroke(accentColor)
                .frame(width: 300, height: 300)
            Hands(minutes: $minuteHand, hours: $hourHand).stroke(accentColor).frame(width: 200, height: 200).shadow(radius: 25)
        }.frame(width: 300, height: 300)
    }
}
 
struct Hands: Shape {
    @Binding var minutes: Int
    @Binding var hours: Int
    
    var minute: Double {
        get {
            Double(minutes)
        }
    }
    var hour: Double {
        get {
            Double(hours)
        }
    }
    
    func getAngles(hour: Double, min: Double) -> [Angle] {
        let hAngle: Angle = Angle.degrees(hour * 30 + min / 2)
        let mAngle: Angle = Angle.degrees(min * 6)
        return [hAngle, mAngle]
    }
    
    func path(in rect: CGRect)-> Path {
        var path = Path()
//       both of these coming in at 300
        let width = rect.size.width
        let height = rect.size.height
        
        let angles = getAngles(hour: hour, min: minute)
        
//        radius of entire frame minus 100 to center it
        let radius: Double = 200/2
        
        
        let hourX = width/2 + (radius*2/3) * sin(angles[0].radians)
        let hourY = width/2 - (radius*2/3) * cos(angles[0].radians)
        
////      this is for 0 degrees - 12
        path.move(to: CGPoint(x: width/2, y: height/2))
        path.addLine(to: CGPoint(x: hourX, y: hourY))
        
        
        let minX = width/2 + (radius) * sin(angles[1].radians)
        let minY = width/2 - (radius) * cos(angles[1].radians)
        
////      this is for 0 degrees - 12
        path.move(to: CGPoint(x: width/2, y: height/2))
        path.addLine(to: CGPoint(x: minX, y: minY))

        return path
    }
}

struct ClockFace: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.50269*width, y: 0.17222*height))
        path.addLine(to: CGPoint(x: 0.50269*width, y: 0.22778*height))
        path.move(to: CGPoint(x: 0.50269*width, y: 0.775*height))
        path.addLine(to: CGPoint(x: 0.50269*width, y: 0.83056*height))
        path.move(to: CGPoint(x: 0.7689*width, y: 0.50294*height))
        path.addLine(to: CGPoint(x: 0.82266*width, y: 0.50294*height))
        path.move(to: CGPoint(x: 0.69239*width, y: 0.68056*height))
        path.addLine(to: CGPoint(x: 0.73293*width, y: 0.71704*height))
        path.move(to: CGPoint(x: 0.27303*width, y: 0.27778*height))
        path.addLine(to: CGPoint(x: 0.31357*width, y: 0.31427*height))
        path.move(to: CGPoint(x: 0.68864*width, y: 0.31649*height))
        path.addLine(to: CGPoint(x: 0.72666*width, y: 0.27721*height))
        path.move(to: CGPoint(x: 0.60753*width, y: 0.25367*height))
        path.addLine(to: CGPoint(x: 0.63441*width, y: 0.20556*height))
        path.move(to: CGPoint(x: 0.37366*width, y: 0.80257*height))
        path.addLine(to: CGPoint(x: 0.39751*width, y: 0.75278*height))
        path.move(to: CGPoint(x: 0.63978*width, y: 0.79256*height))
        path.addLine(to: CGPoint(x: 0.6129*width, y: 0.74444*height))
        path.move(to: CGPoint(x: 0.2543*width, y: 0.40361*height))
        path.addLine(to: CGPoint(x: 0.20699*width, y: 0.37722*height))
        path.move(to: CGPoint(x: 0.26172*width, y: 0.59995*height))
        path.addLine(to: CGPoint(x: 0.21343*width, y: 0.62438*height))
        path.move(to: CGPoint(x: 0.79915*width, y: 0.37857*height))
        path.addLine(to: CGPoint(x: 0.74923*width, y: 0.3992*height))
        path.move(to: CGPoint(x: 0.79515*width, y: 0.62508*height))
        path.addLine(to: CGPoint(x: 0.74731*width, y: 0.59971*height))
        path.move(to: CGPoint(x: 0.40179*width, y: 0.25077*height))
        path.addLine(to: CGPoint(x: 0.37366*width, y: 0.20343*height))
        path.move(to: CGPoint(x: 0.26613*width, y: 0.72602*height))
        path.addLine(to: CGPoint(x: 0.30612*width, y: 0.68889*height))
        path.move(to: CGPoint(x: 0.18288*width, y: 0.50294*height))
        path.addLine(to: CGPoint(x: 0.23664*width, y: 0.50294*height))
        return path
        }
}

#Preview {
    @State @Previewable var timerMinutes: Int = 1
     QuizView(timerMinutes: $timerMinutes)
}
