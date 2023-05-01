//
//  ResultViewController.swift
//  NamesApp
//
//  Created by Artem Morozov on 01.05.2023.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var namesLabel: UILabel!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    var firstName: String!
    var secondName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        namesLabel.text = "\(firstName ?? "") и \(secondName ?? "" )"

        // Do any additional setup after loading the view.
    }

   		
}
