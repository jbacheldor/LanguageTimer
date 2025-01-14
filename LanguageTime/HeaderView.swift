//
//  HeaderView.swift
//  LanguageTime
//
//  Created by Jess  on 1/14/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 20) {
            Button("Home"){
            }.foregroundColor(.black)
                .padding(.top, 2.0)
                .padding(.leading, 10.0)
            Spacer()
            Button("Settings"){
                
            }.foregroundColor(.black)
                .padding(.top, 2.0)
                .padding(.trailing, 10.0)
        }
        .padding()
        .background(Color(red: 0.7647058823529411, green: 0.9333333333333333, blue: 0.6313725490196078))
        .cornerRadius(25)
    }
}

#Preview {
    HeaderView()
}
