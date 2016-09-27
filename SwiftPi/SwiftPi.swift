//
//  File.swift
//  SwiftPi
//
//  Created by Antonio  Hernandez  on 8/23/16.
//  Copyright © 2016 Antonio  Hernandez . All rights reserved.
//

import Foundation

open class SwiftPi: NSObject{
    
    fileprivate var port = ""
    fileprivate var username = ""
    fileprivate var password = ""
    fileprivate var IP = ""
    
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
    
    open func setUsername(_ username: String)
    {
        self.username = username
    }
        
    open func setPassword(_ password: String)
    {
            self.password = password
    }
    
    open func setPort(_ port: String)
    {
            self.port = port
    }
    

    open func setIP(_ newIP: String)
    {
        self.IP = newIP
    }
    
    
    open func setPIN(_ pin: GPIO, state: String)
    {
        
    }
    
    open func getPIN(_ pin: GPIO) -> GPIO    {
        return pin
    }
    
    open func getIp() -> String {
        return self.IP
    }
    
    open func getPort() -> String {
        return self.port
    }
    
    open func getUsername() -> String {
        return self.username
    }
    
    open func getPassword() -> String {
        return self.password
    }
    
    open func setMode(_ pin: GPIO, mode: MODE) -> String
    {
        return Manager.sharedInstance.setMode(username, password: password, ip: IP, port: port, pin: pin, state: mode)
    }

    open func getMode(_ pin: GPIO)-> String
    {
        return Manager.sharedInstance.getMode(username, password: password, ip: IP, port: port, pin: pin)
    }
    
    open func getValue(_ pin: GPIO)-> String
    {
        return Manager.sharedInstance.getValue(username, password: password, ip: IP, port: port, pin: pin)
    }
    
    open func setValue(_ pin: GPIO, value: VALUE)-> String
    {
        return Manager.sharedInstance.setValue(username, password: password, ip: IP, port: port, pin: pin, value: value)
    }
    
    //Asynchronous calls
    open func setModeInBackground(_ pin: GPIO, mode: MODE, onCompletion: ((_ result:String?) -> Void)!)
    {
        Manager.sharedInstance.setModeInBackground(username, password: password, ip: IP, port: port, pin: pin, state: mode, onCompletion: onCompletion)
    }
 
    open func getModeInBackground(_ pin: GPIO, onCompletion: ((_ result:String?) -> Void)!)
    {
       Manager.sharedInstance.getModeInBackground(username, password: password, ip: IP, port: port, pin: pin, onCompletion: onCompletion)
    }
    
    open func getValueInBackground(_ pin: GPIO, onCompletion: ((_ result:String?) -> Void)!)
    {
        Manager.sharedInstance.getValueInBackground(username, password: password, ip: IP, port: port, pin: pin, onCompletion: onCompletion)
    }
    
    open func setValueInBackground(_ pin: GPIO, value: VALUE, onCompletion: ((_ result:String?) -> Void)!)
    {
        Manager.sharedInstance.setValueInBackground(username, password: password, ip: IP, port: port, pin: pin, value: value, onCompletion: onCompletion)
    }
    


}
