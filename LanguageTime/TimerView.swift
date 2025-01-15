//
//  TimerView.swift
//  LanguageTime
//
//  Created by Jess  on 1/14/25.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        HStack(spacing: 20) {
            Text("Timer").foregroundColor(.black)
            Text("0:00").foregroundColor(.black)
        }
        .padding()
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
    }
}

#Preview {
    TimerView()
}
