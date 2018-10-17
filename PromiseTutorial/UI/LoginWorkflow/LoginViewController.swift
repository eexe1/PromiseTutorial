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
                Promise<Bool> { resolver in
                    let hasValue = (self.emailField.text?.count != 0 && self.pwdField.text?.count != 0)
                    resolver.fulfill(hasValue)
                }
            }.then { [unowned self] hasValue -> Promise<Bool> in
                if hasValue {
                    return self.viewModel.validate(self.emailField.text, self.pwdField.text)
                } else {
                    return Promise<Bool> {
                        $0.reject(LoginError.InvalidCredentialFileFormat)
                    }
                }
            }.done { [weak self] success in
                if success {
                    self?.showAlert(with: Localization.get("Login.Alert.Title.Success", alternate: "Success"),
                              message: Localization.get("Login.Alert.Message.Success", alternate: "Welcome to Social Bank"))
                } else {
                    self?.showAlert(with: Localization.get("Login.Alert.Title.Failure", alternate: "Failure"),
                                    message: Localization.get("Login.Alert.Message.Failure", alternate: "Wrong Credentials"))
                }
            }.catch { [weak self] error in
                self?.showAlert(with: Localization.get("Login.Alert.Title.Error", alternate: "Error"),
                                message: Localization.get("Login.Alert.Message.Failure", alternate: "Error Occurred \n"),
                                error: error)
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

extension LoginViewController {
    
    func showAlert(with title: String?, message: String?, error: Error? = nil) {
        var summary: String? = message
        
        if let error = error as? LoginError {
            if summary != nil {
                summary! += error.rawValue
            } else {
                summary = error.rawValue
            }
        }
        
        let alertController = UIAlertController.init(title: title, message: summary, preferredStyle: .alert)
        alertController.addAction(.init(title: Localization.get("Login.Alert.Done", alternate: "Done"), style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
}
