//
//  ViewController.swift
//  iOS0718
//
//  Created by Woojin on 18/07/2019.
//  Copyright © 2019 Woojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    
    @IBAction func click(_ sender: Any) {
        label.text = "버튼클릭"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

