//
//  HelloXPCApp.swift
//  HelloXPC
//
//  Created by John Xu on 6/12/24.
//

import SwiftUI

@main
struct HelloXPCApp: App {
    init() {
        _ = XPCManager.shared
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
