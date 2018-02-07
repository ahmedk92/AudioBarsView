//
//  ViewController.swift
//  AudioBars
//
//  Created by Arabia -IT on 2/7/18.
//  Copyright © 2018 Arabia-IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var audioBarsView: AudioBarsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (_) in
            let p = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            print(p)
            self.audioBarsView.append(power: p)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

