//
//  ThirdViewController.swift
//  ChatWiseHrTask
//
//  Created by Macintosh on 06/06/24.
//

import UIKit
import Kingfisher

class ThirdViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productReturnPolicyLabel: UILabel!
    
    @IBOutlet weak var discriptionLabel: UILabel!
    
    
    
    var productContainer: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
        bindImage()
    }
    
    func bindData() {
        if let product = productContainer {
            productReturnPolicyLabel.text = "\(product.returnPolicy)"
        } else {

            print("No product available")
            productReturnPolicyLabel.text = "No product available"
        }
        self.discriptionLabel.text = productContainer?.description.description.codingKey.stringValue
    }

    func bindImage() {
        if let imageUrlString = productContainer?.images.first, let imageUrl = URL(string: imageUrlString) {
            productImageView.kf.setImage(with: imageUrl)
        } else {
          
            print("No image available")
                   productImageView.image = UIImage(named: "placeholder_image")
        }
      
    }
}
