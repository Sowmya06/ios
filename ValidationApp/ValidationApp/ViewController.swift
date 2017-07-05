//
//  ViewController.swift
//  ValidationApp
//
//  Created by Sowmya Amireddy on 6/28/17.
//  Copyright © 2017 Sowmya Amireddy. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController{

    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button1: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func validateUrl(textField: String) -> Bool {
        let urlRegEx = "((https|http)://)((\\w|-)+)(([.]|[/])((\\w|-)+))+"
        return NSPredicate(format: "SELF MATCHES %@", urlRegEx).evaluate(with: textField)
    }
    
   
   
    @IBAction func safariButton(_ sender: UIButton) {
        let temp = textField.text
        let isValidUrl = validateUrl(textField: temp!)
        
        if isValidUrl{
            print("valid")
            print(isValidUrl)
            let url = URL(string: temp!)
            
            if let myData = url{
                
                let svc = SFSafariViewController(url: myData)
                self.present(svc, animated: true, completion: nil)
            }
        }else{
            print("not valid")
            let alert1 = UIAlertController(title: "My ALert", message: "Please enter valid Url", preferredStyle: UIAlertControllerStyle.alert)
            
            let actionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert1.addAction(actionOk)
            self.present(alert1, animated: true, completion: nil)

        }
}
    @IBAction func buttonClicked(_ sender: UIButton) {
        let temp = textField.text
        
        let isValidUrl = validateUrl(textField: temp!)
        if isValidUrl{
            print("valid")
            print(isValidUrl)
            
            let secondView = self.storyboard?.instantiateViewController(withIdentifier: "secondView") as! SecondViewController
            secondView.stringUrl = temp!
            navigationController?.pushViewController(secondView, animated: true)
        }else{
            let alert1 = UIAlertController(title: "My ALert", message: "Please enter valid Url", preferredStyle: UIAlertControllerStyle.alert)
            
            let actionOk = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert1.addAction(actionOk)
            self.present(alert1, animated: true, completion: nil)
        }

    }
}

        
    


