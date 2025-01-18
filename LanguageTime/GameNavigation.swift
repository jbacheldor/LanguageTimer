//
//  GameNavigation.swift
//  LanguageTime
//
//  Created by Jess  on 1/17/25.
//

import SwiftUI

struct GameNavigation: View {
    var body: some View {
        HStack {
            Text("Time").padding([.leading, .vertical], 15)
            Spacer()
            Text("Dates").padding([.trailing, .vertical], 15)
        }
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(15)
        .padding([.horizontal], 20)
    }
}

#Preview {
    GameNavigation()
}
