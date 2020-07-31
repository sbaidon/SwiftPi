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
    fileprivate init() {} //This prevents others from using the default '()' initializer for this class.
    
    func errorAlert(_ message: String)
    {
//        let alert = UIAlertView(title: "ERROR", message: message, delegate: self, cancelButtonTitle: "OK")
//        alert.show()
    }
    
    func loginString (_ username: String, password: String) -> String
    {
        // set up the base64-encoded credentials
        let loginString = NSString(format: "%@:%@", username, password)
        let loginData: Data = loginString.data(using: String.Encoding.utf8.rawValue)! as Data
        let base64LoginString = loginData.base64EncodedString(options: [])
        return base64LoginString
    }
    
    
    func httpRequest (_ isValue: Bool,username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO, state: SwiftPi.Mode?, value: SwiftPi.Value?) -> URLRequest
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
        let url = URL(string: urlStr)
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = action
        request.setValue("Basic \(loginString(username, password: password))", forHTTPHeaderField: "Authorization")
        return request as URLRequest
    }
    
    func fireRequest(_ request:URLRequest) -> String {
        var responseString:NSString! = "Error"
        // fire off the request
        var response: URLResponse?
        do {
            let data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response)
            responseString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString!)")
            return responseString as String
        } catch (let e) {
            print(e)
            errorAlert(responseString as String)
            return responseString as String
        }
    }
    
    func httpRequestInBackground(_ request: URLRequest, onCompletion: ((_ result:String?) -> Void)!)
    {
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            
            if ( (data) != nil ) {
                let res = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                print("result = \(res!)")
                
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        onCompletion(res as? String)
                    }
                }
                
                
                
            }
            else {
                onCompletion(nil)
            }
            
            }.resume()
    }

    
    func getMode(_ username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO) -> String
    {
        // create the request
        let request = httpRequest(false, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: nil)
        // fire off the request
        let response = fireRequest(request)
        return response
    }
    
    func setMode(_ username: String, password: String, ip: String, port :String,pin: SwiftPi.GPIO, state: SwiftPi.Mode ) -> String
    {
        // create the request
        let request = httpRequest(false,username:username, password: password, ip: ip, port: port, pin: pin, state: state, value: nil)
        // fire off the request
        let response = fireRequest(request)
        return response
    }
    
    func getValue(_ username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO)-> String
    {
        // create the request
        let request = httpRequest(true, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: nil)
        // fire off the request
        let response = fireRequest(request)
        return response
    }
    
    func setValue(_ username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO, value: SwiftPi.Value)-> String
    {
        // create the request
        let request = httpRequest(false, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: value)
        // fire off the request
        let response = fireRequest(request)
        return response
    }
    
    func setModeInBackground(_ username: String, password: String, ip: String, port :String,pin: SwiftPi.GPIO, state: SwiftPi.Mode, onCompletion: ((_ result:String?) -> Void)!)
    {
        
        // create the request
        let request = httpRequest(false,username:username, password: password, ip: ip, port: port, pin: pin, state: state, value: nil)
        // fire off the request
        httpRequestInBackground(request, onCompletion: onCompletion)
    }
    
    func getModeInBackground(_ username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO, onCompletion: ((_ result:String?) -> Void)!)
    {
        
        // create the request
        let request = httpRequest(false, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: nil)
        // fire off the request
        httpRequestInBackground(request, onCompletion: onCompletion)
    }
    
    func getValueInBackground(_ username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO, onCompletion: ((_ result:String?) -> Void)!)
    {
        
        // create the request
        let request = httpRequest(true, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: nil)
        // fire off the request
        httpRequestInBackground(request, onCompletion: onCompletion)
    }
    
    func setValueInBackground(_ username: String, password: String, ip: String, port :String, pin: SwiftPi.GPIO, value: SwiftPi.Value, onCompletion: ((_ result:String?) -> Void)!)
    {
        
        // create the request
        let request = httpRequest(false, username:username, password: password, ip: ip, port: port,pin:pin,state: nil, value: value)
        // fire off the request
        httpRequestInBackground(request, onCompletion: onCompletion)
    }




    
    
}
