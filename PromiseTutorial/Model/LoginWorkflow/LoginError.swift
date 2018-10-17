//
//  LoginError.swift
//  PromiseTutorial
//
//  Created by Evan Tsai on 26/9/18.
//  Copyright © 2018 Evan Tsai. All rights reserved.
//

import Foundation

enum LoginError: String, Error {
    case CredentialFileNotFound
    case InvalidCredentialFileFormat
    case AccountNameNotFound
}
