//
//  ViewModel.swift
//  PromiseTutorial
//
//  Created by Evan Tsai on 26/9/18.
//  Copyright © 2018 Evan Tsai. All rights reserved.
//

import Foundation
import PromiseKit
class ViewModel {
    
    func validate(_ account: String, _ password: String) -> Promise<Bool> {
        
        return Promise<Bool> { resolver in
            do {
                try resolver.fulfill(passwordForAccount(account) == password)
            } catch {
                resolver.reject(error)
            }
        }
    }
    
    private func passwordForAccount(_ accountName: String) throws -> String {
        
        if let path = Bundle.main.path(forResource: "accounts", ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            if let accounts = try? JSONDecoder().decode([Account].self, from: data){
                for account in accounts {
                    if account.accountName == accountName {
                        return account.password
                    }
                }
            } else {
                throw LoginError.InvalidCredentialFileFormat
            }
        } else {
            throw LoginError.CredentialFileNotFound
        }
        throw LoginError.AccountNameNotFound
    }
    
}
