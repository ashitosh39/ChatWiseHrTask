//
//  ViewController.swift
//  ChatWiseHrTask
//
//  Created by Macintosh on 02/06/24.
//

import UIKit

class ViewController: UIViewController {
    var seconViewController : SecondViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickNextBtn(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(secondViewController, animated: true)
        
        }
        
        
        
        
        
    }
    


