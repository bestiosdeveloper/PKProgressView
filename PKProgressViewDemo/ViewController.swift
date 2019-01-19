//
//  ViewController.swift
//  PKProgressViewDemo
//
//  Created by Admin on 18/01/19.
//  Copyright © 2019 Pramod Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var progressView: PKProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        progressView.trackingImage = #imageLiteral(resourceName: "car")
        progressView.progressTint = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        progressView.trackingImageSize = CGSize(width: 50.0, height: 20.0)
        
    }
    
    @IBAction func startButtonAction(_ sender: UIButton) {
        progressView.setProgress(progress: 1.0, inSeconds: 5.0)
    }
}

