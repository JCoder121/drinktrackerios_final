//
//  GIFViewController.swift
//  drinktrackerios
//
//  Created by Jeffrey Chen on 12/23/19.
//  Copyright © 2019 Jeffrey Chen. All rights reserved.
//

import UIKit
import FLAnimatedImage

class GIFViewController: UIViewController {

    
    @IBOutlet weak var waterfall: FLAnimatedImageView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

                let imageData = try! Data(contentsOf: Bundle.main.url(forResource: "true_test", withExtension: "gif")!)
        
        waterfall.animatedImage = FLAnimatedImage(animatedGIFData: imageData)
        
    }
    
    
    
   
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
