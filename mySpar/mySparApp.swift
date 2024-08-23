//
//  mySparApp.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import SwiftUI

@main
struct mySparApp: App {
    @EnvironmentObject var vm: ViewModel
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(ViewModel())
        }
    }
}
