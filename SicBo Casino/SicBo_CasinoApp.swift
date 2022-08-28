//
//  SicBo_CasinoApp.swift
//  SicBo Casino
//
//  Created by Huy Bui Thanh on 15/08/2022.
//

import SwiftUI

@main
struct SicBo_CasinoApp: App {
    
    @StateObject var userProgress = UserProgress()
    var body: some Scene {
        WindowGroup {
            MainMenu()
                .environmentObject(userProgress)
        }
    }
}
