//
//  ViewController.swift
//  calculator
//
//  Created by Muhammet Emre Kemancı on 16.04.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var numberTextView: UITextView!
    @IBOutlet weak var processLabel: UILabel!
    private var sign: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
}

//MARK: - Buttons
extension ViewController{
    @IBAction func numButtons(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else{return}
        numberTextView.text += number
    }
    @IBAction func signButtons(_ sender: UIButton) {
        guard let si = sender.titleLabel?.text else{return}
        numberTextView.text += si
        sign = si
    }
    
    
     @IBAction func acAndDeleteButton(_ sender: UIButton) {
         if sender.titleLabel?.text != "AC"{
             guard numberTextView.text.count > 0 else{return}
             numberTextView.text.removeLast()
         }else{
             numberTextView.text = ""
         }
     }
    
    @IBAction func resultButton(_ sender: UIButton) {
        guard let data = numberTextView.text else{return}
        guard let result = evaluateExpression(data) else{return}
        processLabel.text = data
        numberTextView.text = String(result)
    }
    @IBAction func parantez(_ sender: UIButton) {
        guard let si = sender.titleLabel?.text else{return}
        numberTextView.text += si
    }
    
}
//MARK: - Func
extension ViewController{
   
    func evaluateExpression(_ expression: String) -> Double? {
           let sanitized = expression
               .replacingOccurrences(of: "−", with: "-")
               .replacingOccurrences(of: "–", with: "-")
               .replacingOccurrences(of: " ", with: "")

           let exp = NSExpression(format: sanitized)
           if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
               return result.doubleValue
           }
           return nil
       }
    }
    


