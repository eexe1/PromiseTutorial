//
//  ViewController.swift
//  PromiseTutorial
//
//  Created by Evan Tsai on 26/9/18.
//  Copyright © 2018 Evan Tsai. All rights reserved.
//

import UIKit
import PromiseKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let viewModel = ViewModel()
        
        firstly {
            viewModel.validate("CrazyAsian", "LoveMoney")
        }.done { success in
            if success {
                print("Logged In")
            } else {
                print("Wrong Password")
            }
        }.catch { error in
            print(error)
        }
    }
}

