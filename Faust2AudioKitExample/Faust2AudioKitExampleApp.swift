//
//  Faust2AudioKitExampleApp.swift
//  Faust2AudioKitExample
//
//  Created by m interrupt on 2/25/21.
//

import SwiftUI
import AudioKit

@main
struct Faust2AudioKitExampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class FaustExampleApp: ObservableObject {

    static let shared = FaustExampleApp()

    let engine = AudioEngine()
    var myOsc: FaustMyOsc

    init() {
        myOsc = FaustMyOsc(freq: 333, gain: 0.11)
        engine.output = myOsc
        myOsc.start()
        do {
            try engine.start()
        } catch let err {
            Log(err)
        }
    }
}
