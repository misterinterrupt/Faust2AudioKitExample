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
//    let mixer = Mixer()
//    let akOsc = Oscillator()
    var myOsc: MyOsc
    var dcl: DiodeClipper

    init() {
        myOsc = MyOsc(freq: 330, gain: 0.5)
//        akOsc.amplitude = 0.1
//        akOsc.frequency = 880.0
//        mixer.addInput(myOsc)
//        mixer.addInput(akOsc)
        dcl = DiodeClipper(myOsc)
        engine.output = dcl
        myOsc.start()
//        akOsc.start()
//        myOsc.start()
        do {
            try engine.start()
        } catch let err {
            Log(err)
        }
    }
}
