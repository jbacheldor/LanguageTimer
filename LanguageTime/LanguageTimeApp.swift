//
//  LanguageTimeApp.swift
//  LanguageTime
//
//  Created by Jess  on 1/8/25.
//

import SwiftUI

// indicates the entry point of the app
@main
// there can only be one :App in the program
// tldr: one app to rule them (the files) all

// the format of ---> colon protocol is a fancy way of saying
// this "conforms" to the App protocol - kind of like inherits or typing
struct LanguageTimeApp: App {
//    var body is a REQUIREMENT !! of the App protocol - it's id into the world.
//    no id no driving fella
    var body: some Scene {
//         "some" as seen (no pun intended) from above is what's considered an "opaque" type as opposed to a "concrete" type
//        basically saying -> we expect a return of type "scene"
//        apparently - for swift it's not enough to say 'it's of type this' you need to say 'some' which is opaque and vague but like let's go opposite game - the return type COULD BE OF SOME TYPE SCENE. [typed with hate]
        WindowGroup {
//            windowgroup is a type of scene - the other prominent one is window group
            ContentView()
//            hierarchy of sorts ^^
        }
    }
}
