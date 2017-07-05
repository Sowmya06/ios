//
//  SecondViewController.swift
//  ValidationApp
//
//  Created by Sowmya Amireddy on 6/28/17.
//  Copyright © 2017 Sowmya Amireddy. All rights reserved.
//

import UIKit


class SecondViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var stringUrl:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
            let url = URL(string: stringUrl)
            if let temp = url{
                //print(temp)
                let req = URLRequest(url: temp)
             
                webView.loadRequest(req)
               // print(req)
        
            }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
