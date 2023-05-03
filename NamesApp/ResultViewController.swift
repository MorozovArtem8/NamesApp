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
    
    private var resultValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultValue = findResult()
        
        namesLabel.text = "\(firstName ?? "") и \(secondName ?? "" )"
        
        resultLabel.text = resultValue.formatted(.percent)
        
        progressView.progress = Float(resultValue) / 100
        progressView.transform = progressView.transform.scaledBy(x: 1, y: 4)

        // Do any additional setup after loading the view.
    }
    
    private func findValue(for name: String) -> Int {
        var count = 0
        for character in name.lowercased() {
            switch character {
            case "a", "i", "j", "q", "y":
                count += 1
            case "b", "k", "r":
                count += 2
            case "c", "g", "l", "s":
                count += 3
            case "d", "m", "t":
                count += 4
            case "e", "h", "n", "x":
                count += 5
            case "u", "v", "w":
                count += 6
            case "o", "z":
                count += 7
            case "f", "p":
                count += 8
            default:
                count += 0
            }
            
        }
        
        return count
    }
    
    private func findResult() -> Int {
        var result = 0
        
        let firstValue = findValue(for: firstName)
        let secondValue = findValue(for: secondName)
        let absDifference = abs(firstValue - secondValue)
        
        switch absDifference {
        case 0, 1, 2:
            result = 100
        case 3:
            result = 90
        case 4:
            result = 80
        case 5:
            result = 70
        case 6:
            result = 60
        case 7:
            result = 50
        default:
            result = 40
        }
        
        return result
    }

    @IBAction func backButtonTapped() {
        performSegue(withIdentifier: "unwindSegue", sender: nil)
    }
    
}
