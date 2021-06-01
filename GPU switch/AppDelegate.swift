//
//  AppDelegate.swift
//  GPU switch
//
//  Created by 齐镜翔 on 2021/6/2.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
    
    @IBOutlet weak var menu: NSMenu!
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "statusIcon")
            statusItem.menu = menu
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    //battery
    @IBAction func B_auto(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -b GPUSwitch 2\" with administrator privileges")!.executeAndReturnError(nil)
    }
    
    @IBAction func B_inter(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -b GPUSwitch 0\" with administrator privileges")!.executeAndReturnError(nil)
    }
    
    @IBAction func B_disc(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -b GPUSwitch 1\" with administrator privileges")!.executeAndReturnError(nil)
    }
    
    //charge
    @IBAction func C_auto(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -c GPUSwitch 2\" with administrator privileges")!.executeAndReturnError(nil)
    }
    
    @IBAction func C_inter(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -c GPUSwitch 0\" with administrator privileges")!.executeAndReturnError(nil)
    }
    
    @IBAction func C_disc(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -c GPUSwitch 1\" with administrator privileges")!.executeAndReturnError(nil)
    }
    
    
    @IBAction func A_auto(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -a GPUSwitch 2\" with administrator privileges")!.executeAndReturnError(nil)
    }
    
    @IBAction func A_inter(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -a GPUSwitch 0\" with administrator privileges")!.executeAndReturnError(nil)
    }
    
    @IBAction func A_disc(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -a GPUSwitch 1\" with administrator privileges")!.executeAndReturnError(nil)
    }
}

