//
//  File.swift
//  SwiftPi
//
//  Created by Antonio  Hernandez  on 8/23/16.
//  Copyright © 2016 Antonio  Hernandez . All rights reserved.
//

import Foundation

public class SwiftPi: NSObject{
    
    private var port = ""
    private var username = ""
    private var password = ""
    private var IP = ""
    
   public enum GPIO : String{
    
        case ONE = "1"
        case TWO = "2"
        case THREE = "3"
        case FOUR = "4"
        case FIVE = "5"
        case SIX = "6"
        case SEVEN = "7"
        case EIGHT = "8"
        case NINE = "9"
        case TEN = "10"
        case ELEVEN = "11"
        case TWELVE = "12"
        case THIRTEEN = "13"
        case FOURTEEN = "14"
        case FIFTEEN = "15"
        case SIXTEEN = "16"
        case SEVENTEEN = "17"
        case EIGHTEEN = "18"
        case NINETEEN = "19"
        case TWENTY = "20"
        case TWENTYONE = "21"
        case TWENTYTWO = "22"
        case TWENTYTHREE = "23"
        case TWENTYFOUR = "24"
        case TWENTYFIVE = "25"
        case TWENTYSIX = "26"
        
    }
 
    
    public enum MODE : String {
        case IN = "in"
        case OUT = "out"
        
    }
    public enum VALUE : String {
        case OFF = "0"
        case ON = "1"
        
    }
    
    

    
    
    public init(username: String, password: String, ip: String, port: String){
        self.IP = ip
        self.username = username
        self.password = password
        self.port = port
    }
    
    public func setUsername(username: String)
    {
        self.username = username
    }
        
    public func setPassword(password: String)
    {
            self.password = password
    }
    
    public func setPort(port: String)
    {
            self.port = port
    }
    

    public func setIP(newIP: String)
    {
        self.IP = newIP
    }
    
    
    public func setPIN(pin: GPIO, state: String)
    {
        
    }
    
    public func getPIN(pin: GPIO) -> GPIO    {
        return pin
    }
    
    public func getIp() -> String {
        return self.IP
    }
    
    public func getPort() -> String {
        return self.port
    }
    
    public func getUsername() -> String {
        return self.username
    }
    
    public func getPassword() -> String {
        return self.password
    }
    
    public func setMode(pin: GPIO, mode: MODE) -> String
    {
        return Manager.sharedInstance.setMode(username, password: password, ip: IP, port: port, pin: pin, state: mode)
    }

    public func getMode(pin: GPIO)-> String
    {
        return Manager.sharedInstance.getMode(username, password: password, ip: IP, port: port, pin: pin)
    }
    
    public func getValue(pin: GPIO)-> String
    {
        return Manager.sharedInstance.getValue(username, password: password, ip: IP, port: port, pin: pin)
    }
    
    public func setValue(pin: GPIO, value: VALUE)-> String
    {
        return Manager.sharedInstance.setValue(username, password: password, ip: IP, port: port, pin: pin, value: value)
    }
    
    //Asynchronous calls
    public func setModeInBackground(pin: GPIO, mode: MODE, onCompletion: ((result:String?) -> Void)!)
    {
        Manager.sharedInstance.setModeInBackground(username, password: password, ip: IP, port: port, pin: pin, state: mode, onCompletion: onCompletion)
    }
 
    public func getModeInBackground(pin: GPIO, onCompletion: ((result:String?) -> Void)!)
    {
       Manager.sharedInstance.getModeInBackground(username, password: password, ip: IP, port: port, pin: pin, onCompletion: onCompletion)
    }
    
    public func getValueInBackground(pin: GPIO, onCompletion: ((result:String?) -> Void)!)
    {
        Manager.sharedInstance.getValueInBackground(username, password: password, ip: IP, port: port, pin: pin, onCompletion: onCompletion)
    }
    
    public func setValueInBackground(pin: GPIO, value: VALUE, onCompletion: ((result:String?) -> Void)!)
    {
        Manager.sharedInstance.setValueInBackground(username, password: password, ip: IP, port: port, pin: pin, value: value, onCompletion: onCompletion)
    }
    


}
