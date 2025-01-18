//
//  HeaderView.swift
//  LanguageTime
//
//  Created by Jess  on 1/14/25.
//

import SwiftUI

struct HeaderView: View {
    @State private var min : Double = 15.0
    var body: some View {
        NavigationView{
            HStack(spacing: 20) {
                NavigationLink{
                    HomeView()
                } label : {
                    Text("Home")
                }.foregroundColor(.black)
                    .padding(.top, 2.0)
                    .padding(.leading, 10.0)
                Spacer()
                NavigationLink{
                    HomeView()
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
        }
}
        
}

#Preview {
    HeaderView()
}
