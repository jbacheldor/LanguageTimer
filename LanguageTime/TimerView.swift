//
//  TimerView.swift
//  LanguageTime
//
//  Created by Jess  on 1/14/25.
//

import SwiftUI

struct TimerView: View {
//    @Binding var min : Int
    @State private var isTimerRunning: Bool = false
    @State private var seconds: Int = 0
    @Binding var minutes: Int
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var tap: some Gesture {
           TapGesture()
               .onEnded{
                   isTimerRunning.toggle()
               }
       }
    
    static var duratioinFormatter: DateComponentsFormatter = {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            formatter.unitsStyle = .abbreviated
            formatter.zeroFormattingBehavior = .dropLeading
            return formatter
        }()
    
    func calculateTime() {
        if(self.seconds == 0){
            self.minutes -= 1
            self.seconds = 59
        }
        else {
            self.seconds -= 1
        }
        }

    var body: some View {
        HStack(spacing: 20) {
            Text("Timer \(minutes):\(seconds == 0 ? "00" : String(seconds))").foregroundColor(.black)
                .onReceive(timer){ firedDate in
                    if (self.seconds > 0 || self.minutes > 0) && isTimerRunning {
                        calculateTime()
                    }
                }
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804))
                .frame(width: 70, height: 40, alignment: .center)
                .gesture(tap)
                .overlay(Text("\(isTimerRunning ? "Stop" : "Start")"))
        }
        .padding()
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
        .shadow(color: Color(red: 0.5215686274509804, green: 0.6784313725490196, blue: 0.3215686274509804), radius: 5, x: 5, y: 5)
    }
}

//#Preview {
//    TimerView()
//}
