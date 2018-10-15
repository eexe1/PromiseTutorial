//
//  ViewController.swift
//  PromiseTutorial
//
//  Created by Evan Tsai on 26/9/18.
//  Copyright © 2018 Evan Tsai. All rights reserved.
//

import UIKit
import LocalizationKit

class ContentViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ContentViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel = ContentViewModel()

        navigationItem.title = Localization.get("Content.Nav.Title", alternate: "Promise Tutorial")
    }
}

extension ContentViewController: UITableViewDataSource {
    
    static let identifier = "ContentCell"
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections[section].list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: ContentViewController.identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: ContentViewController.identifier)
        }
        cell!.textLabel?.text = viewModel?.sections[indexPath.section].list[indexPath.row]
        
        return cell!
    }
}

extension ContentViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate to demo pages
        
        if let key = viewModel?.sections[indexPath.section].list[indexPath.row] {
            if let action = viewModel?.sections[indexPath.section].actionMap[key] {
                switch action {
                case .LoginWorkflow:
                    self.performSegue(withIdentifier: "showLoginLandingPagea", sender: nil)
                case .DynamicTable:
                    break
                }
            }
        }
    }
}

