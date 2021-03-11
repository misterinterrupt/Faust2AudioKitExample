//
//  ContentView.swift
//  Faust2AudioKitExample
//
//  Created by m interrupt on 2/25/21.
//

import SwiftUI

struct ContentView: View {
    var app: FaustExampleApp = .shared
    var body: some View {
        Text("Faust!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
