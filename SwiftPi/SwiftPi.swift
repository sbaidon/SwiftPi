//
//  File.swift
//  SwiftPi
//
//  Created by Antonio  Hernandez  on 8/23/16.
//  Copyright © 2016 Antonio  Hernandez . All rights reserved.
//

import Foundation

open class SwiftPi: NSObject {
    
    /// Read only properties
    private(set) var port = ""
    private(set) var username = ""
    private(set) var password = ""
    private(set)var ip = ""
    
   public enum GPIO: String {
    
        case one            = "1"
        case two            = "2"
        case three          = "3"
        case four           = "4"
        case five           = "5"
        case six            = "6"
        case seven          = "7"
        case eight          = "8"
        case nine           = "9"
        case ten            = "10"
        case eleven         = "11"
        case twelve         = "12"
        case thirteen       = "13"
        case fourteen       = "14"
        case fifteen        = "15"
        case sixteen        = "16"
        case seventeen      = "17"
        case eighteen       = "18"
        case nineteen       = "19"
        case twenty         = "20"
        case twentyone      = "21"
        case twentytwo      = "22"
        case twentythree    = "23"
        case twentyfour     = "24"
        case twentyfive     = "25"
        case twentysix      = "26"
        
    }
 
    public enum Mode: String {
        case `in` = "in"
        case out  = "out"
        
    }
    public enum Value: String {
        case off = "0"
        case on  = "1"
        
    }
    
    public init(username: String,
                password: String,
                ip: String,
                port: String) {
        self.ip = ip
        self.username = username
        self.password = password
        self.port = port
    }
    
    open func setUsername(_ username: String) {
        self.username = username
    }
    
    open func setPassword(_ password: String) {
        self.password = password
    }
    
    open func setPort(_ port: String) {
        self.port = port
    }
    
    open func setIP(_ newIP: String) {
        self.ip = newIP
    }
    
    open func getIp() -> String {
        self.ip
    }
    
    open func getPort() -> String {
        self.port
    }
    
    open func getUsername() -> String {
        self.username
    }
    
    open func getPassword() -> String {
        self.password
    }
    
    open func setMode(_ pin: GPIO, mode: Mode) -> String {
        Manager.sharedInstance.setMode(username, password: password, ip: ip, port: port, pin: pin, state: mode)
    }

    open func getMode(_ pin: GPIO) -> String {
        Manager.sharedInstance.getMode(username, password: password, ip: ip, port: port, pin: pin)
    }
    
    open func getValue(_ pin: GPIO) -> String {
        Manager.sharedInstance.getValue(username, password: password, ip: ip, port: port, pin: pin)
    }
    
    open func setValue(_ pin: GPIO, value: Value) -> String {
        Manager.sharedInstance.setValue(username, password: password, ip: ip, port: port, pin: pin, value: value)
    }
    
    //Asynchronous calls
    open func setModeInBackground(_ pin: GPIO, mode: Mode, onCompletion: ((_ result:String?) -> Void)!) {
        Manager.sharedInstance.setModeInBackground(username, password: password, ip: ip, port: port, pin: pin, state: mode, onCompletion: onCompletion)
    }
 
    open func getModeInBackground(_ pin: GPIO, onCompletion: ((_ result:String?) -> Void)!) {
       Manager.sharedInstance.getModeInBackground(username, password: password, ip: ip, port: port, pin: pin, onCompletion: onCompletion)
    }
    
    open func getValueInBackground(_ pin: GPIO, onCompletion: ((_ result:String?) -> Void)!) {
        Manager.sharedInstance.getValueInBackground(username, password: password, ip: ip, port: port, pin: pin, onCompletion: onCompletion)
    }
    
    open func setValueInBackground(_ pin: GPIO, value: Value, onCompletion: ((_ result:String?) -> Void)!) {
        Manager.sharedInstance.setValueInBackground(username, password: password, ip: ip, port: port, pin: pin, value: value, onCompletion: onCompletion)
    }
}
