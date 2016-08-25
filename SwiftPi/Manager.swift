//
//  Manager.swift
//  SwiftPi
//
//  Created by Antonio  Hernandez  on 8/24/16.
//  Copyright © 2016 Antonio  Hernandez . All rights reserved.
//

import Foundation


class Manager {
    static let sharedInstance = Manager()
    private init() {} //This prevents others from using the default '()' initializer for this class.
    
    func errorAlert(message: String)
    {
        let alert = UIAlertView(title: "ERROR", message: message, delegate: self, cancelButtonTitle: "OK")
        alert.show()
    }
    
    func loginString (username: String, password: String) -> String
    {
        // set up the base64-encoded credentials
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: NSData = loginString.dataUsingEncoding(NSUTF8StringEncoding)!
        let base64LoginString = loginData.base64EncodedStringWithOptions([])
        return base64LoginString
    }
    
    
    func httpRequest (isValue: Bool,username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO, state: SwiftPi.MODE?, value: SwiftPi.VALUE?) -> NSURLRequest
    {
        
        var action = ""
        var urlStr = ""
        if(isValue)
        {
            urlStr = "http://\(ip):\(port)/GPIO/\(pin.rawValue)/value"
            action = "GET"
        }
        else
        {
            if let io = state
            {
                urlStr = "http://\(ip):\(port)/GPIO/\(pin.rawValue)/function/\(io.rawValue)"
                action = "POST"
            }
            else
            {
                if let val = value
                {
                    urlStr = "http://\(ip):\(port)/GPIO/\(pin.rawValue)/value/\(val.rawValue)"
                    action = "POST"
                }
                else
                {
                    urlStr = "http://\(ip):\(port)/GPIO/\(pin.rawValue)/function"
                    action = "GET"
                }
            }
            
        }
        let url = NSURL(string: urlStr)
        let request = NSMutableURLRequest(URL: url!)
        request.HTTPMethod = action
        request.setValue("Basic \(loginString(username, password: password))", forHTTPHeaderField: "Authorization")
        return request
    }
    
    func fireRequest(request:NSURLRequest) -> String {
        var responseString:NSString! = "Error"
        // fire off the request
        var response: NSURLResponse?
        do {
            let data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString!)")
            return responseString as String
        } catch (let e) {
            print(e)
            errorAlert(responseString as String)
            return responseString as String
        }
    }
    
    func httpRequestInBackground(request: NSURLRequest, onCompletion: ((result:String?) -> Void)!)
    {
        
        NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            
            if ( (data) != nil ) {
                let res = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("result = \(res!)")
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
                    dispatch_async(dispatch_get_main_queue()) {
                        onCompletion(result: res as? String)
                    }
                }
            }
            else {
                onCompletion(result: nil)
            }
            
            }.resume()
    }

    
    func getMode(username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO) -> String
    {
        // create the request
        let request = httpRequest(false, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: nil)
        // fire off the request
        let response = fireRequest(request)
        return response
    }
    
    func setMode(username: String, password: String, ip: String, port :String,pin: SwiftPi.GPIO, state: SwiftPi.MODE ) -> String
    {
        // create the request
        let request = httpRequest(false,username:username, password: password, ip: ip, port: port, pin: pin, state: state, value: nil)
        // fire off the request
        let response = fireRequest(request)
        return response
    }
    
    func getValue(username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO)-> String
    {
        // create the request
        let request = httpRequest(true, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: nil)
        // fire off the request
        let response = fireRequest(request)
        return response
    }
    
    func setValue(username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO, value: SwiftPi.VALUE)-> String
    {
        // create the request
        let request = httpRequest(false, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: value)
        // fire off the request
        let response = fireRequest(request)
        return response
    }
    
    func setModeInBackground(username: String, password: String, ip: String, port :String,pin: SwiftPi.GPIO, state: SwiftPi.MODE ) -> String
    {
        var response = ""
        // create the request
        let request = httpRequest(false,username:username, password: password, ip: ip, port: port, pin: pin, state: state, value: nil)
        // fire off the request
        httpRequestInBackground(request) { (result) -> Void in
            if let res = result {
                print(res)
                response = res
                
            }
        }
        return response
    }
    
    func getModeInBackground(username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO) -> String
    {
        var response = ""
        // create the request
        let request = httpRequest(false, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: nil)
        // fire off the request
        httpRequestInBackground(request) { (result) -> Void in
            if let res = result {
                print(res)
                response = res
                
            }
        }
        return response
    }
    
    func getValueInBackground(username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO)-> String
    {
        var response = ""
        // create the request
        let request = httpRequest(true, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: nil)
        // fire off the request
        httpRequestInBackground(request) { (result) -> Void in
            if let res = result {
                print(res)
                response = res
                
            }
        }
        return response
    }
    
    func setValueInBackground(username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO, value: SwiftPi.VALUE)-> String
    {
        var response = ""
        // create the request
        let request = httpRequest(false, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: value)
        // fire off the request
        httpRequestInBackground(request) { (result) -> Void in
            if let res = result {
                print(res)
                response = res
                
            }
        }
        return response
    }




    
    
}
