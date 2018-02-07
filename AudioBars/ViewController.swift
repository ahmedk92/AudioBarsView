//
//  ViewController.swift
//  AudioBars
//
//  Created by Arabia -IT on 2/7/18.
//  Copyright © 2018 Arabia-IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var audioBarsView1: AudioBarsView!
    @IBOutlet weak var audioBarsView2: AudioBarsView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (_) in
            let p1 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            print(p1)
            self.audioBarsView1.append(power: p1)
            
            let p2 = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            print(p2)
            self.audioBarsView2.append(power: p2)

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

