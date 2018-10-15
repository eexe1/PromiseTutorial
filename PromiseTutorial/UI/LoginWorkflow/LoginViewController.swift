//
//  LoginViewController.swift
//  PromiseTutorial
//
//  Created by EvanTsai on 2018/10/15.
//  Copyright © 2018年 Evan Tsai. All rights reserved.
//

import UIKit
import SnapKit
import LocalizationKit
import PromiseKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var pwdField: UITextField!
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        
    }
    
    @IBAction func submitForm(_ sender: Any) {
        
        firstly {
            viewModel.validate(emailField.text, pwdField.text)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
