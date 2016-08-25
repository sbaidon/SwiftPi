//
//  TestViewController.swift
//  Example
//
//  Created by Antonio  Hernandez  on 8/24/16.
//  Copyright © 2016 Antonio  Hernandez . All rights reserved.
//

import UIKit
import SwiftPi

class TestViewController: UIViewController {
    let swiftPi = SwiftPi(username:"webiopi", password: "raspberry", ip:"10.33.27.92", port: "8000")
    @IBOutlet weak var lblMode: UILabel!
    
    @IBOutlet weak var swMode: UISegmentedControl!
    
    @IBAction func getMode(sender: AnyObject) {
        // set up the base64-encoded credentials
        swiftPi.getMode(.TWO)
    }
    
    @IBAction func setMode(sender: AnyObject) {
        // set up the base64-encoded credentials
        var state:SwiftPi.MODE
        switch swMode.selectedSegmentIndex {
        case 0:
            state = .IN
        case 1:
            state = .OUT
        case 2:
            state = .OUT
        default:
            state = .IN
        }
        print(state)
        swiftPi.setMode(.TWO, mode: state)
    }
}