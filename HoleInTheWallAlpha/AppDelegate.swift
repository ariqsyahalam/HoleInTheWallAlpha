//
//  AppDelegate.swift
//  HoleInTheWallAlpha
//
//  Created by Reyhan Ariq Syahalam on 22/05/24.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var window: NSWindow?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        if let window = NSApplication.shared.windows.first {
            // Set the initial size of the window
            window.setContentSize(NSSize(width: 1728, height: 1117))
            window.center() // Optional: Center the window on screen
            
            // Make the window non-resizable
            window.styleMask.remove(.resizable)
        }
    }
    
    func applicationWillTerminate(_ notification: Notification) {
        // Insert code here to tear down your application
    }
}


