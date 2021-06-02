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
    @IBOutlet weak var b_a: NSMenuItem!
    @IBOutlet weak var b_i: NSMenuItem!
    @IBOutlet weak var b_d: NSMenuItem!
    @IBOutlet weak var c_a: NSMenuItem!
    @IBOutlet weak var c_i: NSMenuItem!
    @IBOutlet weak var c_d: NSMenuItem!
    @IBOutlet weak var a_a: NSMenuItem!
    @IBOutlet weak var a_i: NSMenuItem!
    @IBOutlet weak var a_d: NSMenuItem!
    
//    var b_a_s = false
//    var b_i_s = false
//    var b_d_s = false
//    var c_a_s = false
//    var c_i_s = false
//    var c_d_s = false
//    var a_a_s = false
//    var a_i_s = false
//    var a_d_s = false
    
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
        b_a.state = NSControl.StateValue.on
        b_i.state = NSControl.StateValue.off
        b_d.state = NSControl.StateValue.off
        
    }
    
    @IBAction func B_inter(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -b GPUSwitch 0\" with administrator privileges")!.executeAndReturnError(nil)
        b_a.state = NSControl.StateValue.off
        b_i.state = NSControl.StateValue.on
        b_d.state = NSControl.StateValue.off
    }
    
    @IBAction func B_disc(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -b GPUSwitch 1\" with administrator privileges")!.executeAndReturnError(nil)
        b_a.state = NSControl.StateValue.off
        b_i.state = NSControl.StateValue.off
        b_d.state = NSControl.StateValue.on
    }
    //charge
    @IBAction func C_auto(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -c GPUSwitch 2\" with administrator privileges")!.executeAndReturnError(nil)
        c_a.state = NSControl.StateValue.on
        c_i.state = NSControl.StateValue.off
        c_d.state = NSControl.StateValue.off
    }
    
    @IBAction func C_inter(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -c GPUSwitch 0\" with administrator privileges")!.executeAndReturnError(nil)
        c_a.state = NSControl.StateValue.off
        c_i.state = NSControl.StateValue.on
        c_d.state = NSControl.StateValue.off
    }
    
    @IBAction func C_disc(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -c GPUSwitch 1\" with administrator privileges")!.executeAndReturnError(nil)
        c_a.state = NSControl.StateValue.off
        c_i.state = NSControl.StateValue.off
        c_d.state = NSControl.StateValue.on
    }
    
    // battery & charge mode
    @IBAction func A_auto(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -a GPUSwitch 2\" with administrator privileges")!.executeAndReturnError(nil)
        b_a.state = NSControl.StateValue.off
        b_i.state = NSControl.StateValue.off
        b_d.state = NSControl.StateValue.off
        c_a.state = NSControl.StateValue.off
        c_i.state = NSControl.StateValue.off
        c_d.state = NSControl.StateValue.off
        a_a.state = NSControl.StateValue.on
        a_i.state = NSControl.StateValue.off
        a_d.state = NSControl.StateValue.off
    }
    
    @IBAction func A_inter(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -a GPUSwitch 0\" with administrator privileges")!.executeAndReturnError(nil)
        b_a.state = NSControl.StateValue.off
        b_i.state = NSControl.StateValue.off
        b_d.state = NSControl.StateValue.off
        c_a.state = NSControl.StateValue.off
        c_i.state = NSControl.StateValue.off
        c_d.state = NSControl.StateValue.off
        a_a.state = NSControl.StateValue.off
        a_i.state = NSControl.StateValue.on
        a_d.state = NSControl.StateValue.off
    }
    
    @IBAction func A_disc(_ sender: Any) {
        NSAppleScript(source: "do shell script \"sudo pmset -a GPUSwitch 1\" with administrator privileges")!.executeAndReturnError(nil)
        b_a.state = NSControl.StateValue.off
        b_i.state = NSControl.StateValue.off
        b_d.state = NSControl.StateValue.off
        c_a.state = NSControl.StateValue.off
        c_i.state = NSControl.StateValue.off
        c_d.state = NSControl.StateValue.off
        a_a.state = NSControl.StateValue.off
        a_i.state = NSControl.StateValue.off
        a_d.state = NSControl.StateValue.on
    }
    @IBAction func quit(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
}

