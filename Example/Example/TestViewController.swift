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
    let swiftPi = SwiftPi(username:"webiopi", password: "raspberry", ip:"10.33.10.18", port: "8000")
    @IBOutlet weak var lblMode: UILabel!
    
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var swMode: UISegmentedControl!
    
    @IBOutlet weak var swValue: UISwitch!
    
    @IBAction func getMode(sender: AnyObject) {
        // set up the base64-encoded credentials
        lblMode.text = swiftPi.getMode(.TWO)
    }
    
    @IBAction func valueChanged(sender: AnyObject)
    {
        if swValue.on
        {
            lblValue.text = swiftPi.setValue(.TWO, value: .ON)
        }
        else
        {
            lblValue.text = swiftPi.setValue(.TWO, value: .OFF)
        }
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
        lblMode.text = swiftPi.setMode(.TWO, mode: state)
    }
}
