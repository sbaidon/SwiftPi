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
    let swiftPi = SwiftPi(username:"webiopi", password: "raspberry", ip: "10.33.10.18", port: "8000")
    @IBOutlet weak var lblMode: UILabel!
    
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var swMode: UISegmentedControl!
    
    @IBOutlet weak var swValue: UISwitch!
    
    @IBAction func getMode(_ sender: AnyObject) {
        // set up the base64-encoded credentials
        
        swiftPi.getModeInBackground(.two){ (result) -> Void in
            if let res = result {
                print(res)
                self.lblMode.text = res
                
            }
        }
        lblMode.text = "Cargando..."
    }
    
    @IBAction func valueChanged(_ sender: AnyObject)
    {
        if swValue.isOn
        {
            swiftPi.setValueInBackground(.two, value: .on) { (result) -> Void in
                if let res = result {
                    print(res)
                    self.lblValue.text = res
                    
                }
            }

        }
        else
        {
            swiftPi.setValueInBackground(.two, value: .off) { (result) -> Void in
                if let res = result {
                    print(res)
                    self.lblValue.text = res
                    
                }
            }
        }
        lblValue.text = "Cargando..."
    }
    
    @IBAction func setMode(_ sender: AnyObject) {
        // set up the base64-encoded credentials
        var state: SwiftPi.Mode
        switch swMode.selectedSegmentIndex {
        case 0:
            state = .in
        case 1:
            state = .out
        case 2:
            state = .out
        default:
            state = .in
        }
        print(state)
        
        swiftPi.setModeInBackground(.two, mode: state){ (result) -> Void in
            if let res = result {
                print(res)
                self.lblMode.text = res
                
            }
        }

        
        lblMode.text = "Cargando..."
    }
}
