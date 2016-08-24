//
//  File.swift
//  SwiftPi
//
//  Created by Antonio  Hernandez  on 8/23/16.
//  Copyright © 2016 Antonio  Hernandez . All rights reserved.
//

import Foundation

class SwiftPi: NSObject{
    
    private var port = ""
    private var username = ""
    private var password = ""
    private var IP = ""
    enum GPIO : String{
    
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
    
    
    init(username: String, password: String, port: String){
        self.username = username
        self.password = password
        self.port = port
    }
    
    func setUsername(username: String)
    {
        self.username = username
    }
        
    func setPassword(password: String)
    {
            self.password = password
    }
    
    func setPort(port: String)
    {
            self.port = port
    }
    

    func setIP(newIP: String)
    {
        self.IP = newIP
    }
    
    
    func setPIN(pin: GPIO, state: String)
    {
        
    }
    
    func getPIN(pin: GPIO) -> GPIO    {
        return pin
    }
    
    func getIp() -> String {
        return self.IP
    }
    
    func getPort() -> String {
        return self.port
    }
    
    func getUsername() -> String {
        return self.username
    }
    
    func getPassword() -> String {
        return self.password
    }
    
    
    
    func setMode(pin: GPIO)
    {
        
    }
    
    func getMode(pin: GPIO)-> GPIO
    {
        // set up the base64-encoded credentials
        let loginString = NSString(format: "%@:%@", self.getUsername(), password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions([])
        
        // create the request
        let url = NSURL(string: "http://" + ip + ":8000/GPIO/2/function")
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        // fire off the request
        var response: NSURLResponse?
        do {
            let data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString!)")
            lblMode.text = responseString! as String
        } catch (let e) {
            print(e)
        }
        
        return pin
    }
    












}
