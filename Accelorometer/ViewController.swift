//
//  ViewController.swift
//  Accelorometer
//
//  Created by Vivek Rai on 19/01/19.
//  Copyright © 2019 Vivek Rai. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
        
    }
    
    func updateLabels(data: CMAccelerometerData?, error: Error?){
        guard let accelorometerData = data else { return }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 2
        
        let x = formatter.string(for: accelorometerData.acceleration.x)
        let y = formatter.string(for: accelorometerData.acceleration.y)
        let z = formatter.string(for: accelorometerData.acceleration.z)

        
        xLabel.text = "X : " + x!
        yLabel.text = "Y : " + y!
        zLabel.text = "Z : " + z!
        
    }
    
    


}

