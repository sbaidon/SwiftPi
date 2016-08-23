//
//  File.swift
//  SwiftPi
//
//  Created by Antonio  Hernandez  on 8/23/16.
//  Copyright © 2016 Antonio  Hernandez . All rights reserved.
//

import Foundation

class SwiftPi: NSObject{
    
    private var port = 0
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
    
    
    override init(){
    
    
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
    func setMode(pin: GPIO)
    {
        
    }
    
    func getMode(pin: GPIO)-> GPIO
    {
        return pin
    }
    












}
