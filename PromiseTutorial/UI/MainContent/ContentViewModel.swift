//
//  ViewModel.swift
//  PromiseTutorial
//
//  Created by Evan Tsai on 26/9/18.
//  Copyright © 2018 Evan Tsai. All rights reserved.
//

import Foundation
import LocalizationKit

class ContentViewModel {
    
    var sections: [ContentSection]
    
    init() {
        sections = [
            ContentSection.init(header: Localization.get("Content.Header.Scenario", alternate: "Scenario"),
                                list: [
                Localization.get("Content.List.Login", alternate: "Login"),
                Localization.get("Content.List.DynamicTable", alternate: "DynamicTable")],
                                actionMap: [
                Localization.get("Content.List.Login", alternate: "Login") : .LoginWorkflow,
                Localization.get("Content.List.DynamicTable", alternate: "DynamicTable") : .DynamicTable])
        ]
    }
}

/// content of a section
class ContentSection {
    
    let header: String
    let list: [String]
    let actionMap: [String: ContentAction]
    
    init(header: String, list: [String], actionMap: [String: ContentAction]) {
        self.header = header
        self.list = list
        self.actionMap = actionMap
    }
    
}

enum ContentAction {
    case LoginWorkflow
    case DynamicTable
}
