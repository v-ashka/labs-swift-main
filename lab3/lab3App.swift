//
//  lab3App.swift
//  lab3
//
//  Created by vashka on 16/10/2023.
//

import SwiftUI

@main
struct lab3App: App {
    @StateObject var viewmodel = MemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewmodel)
        }
    }
}
