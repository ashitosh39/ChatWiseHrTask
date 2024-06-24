//
//  SecondViewController.swift
//  ChatWiseHrTask
//
//  Created by Macintosh on 02/06/24.
//

import UIKit
import Kingfisher
class SecondViewController: UIViewController {
        
    @IBOutlet weak var productTableView: UITableView!
    var url : URL?
    var products : [Product] = []
    var jsonDecoder : JSONDecoder?
    var urlSession : URLSession?
    var urlRequest : URLRequest?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        initializeTableView()
        registerXIBWithTableView()
    }
    func initializeTableView(){
        productTableView.dataSource = self
        productTableView.delegate = self
    }
    
    func registerXIBWithTableView(){
       var uiNib = UINib(nibName:"ProductTableViewCell" , bundle: nil)
        self.productTableView.register(uiNib, forCellReuseIdentifier: "ProductTableViewCell")
    }
    func fetchData() {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            print("Invalid URL")
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let productsResponse = try JSONDecoder().decode(ProductResponse.self, from: data)
                self.products = productsResponse.products
                
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }

//    func fetchData(){
//        var url = URL(string : "https://dummyjson.com/products")
//        var urlRequest = URLRequest(url : url!)
//        var urlSession = URLSession(configuration: .default)
//        var dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            self.products = try! JSONDecoder().decode([Product].self, from: data!)
//            self.jsonDecoder = JSONDecoder()
//            print(self.products)
//                DispatchQueue.main.async {
//                self.productTableView.reloadData()
//               }
//           }
//      dataTask.resume()
//    }
//}
}
extension SecondViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  productTableaviewCell = self.productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
       
        productTableaviewCell.titelLabel.text = "\(products[indexPath.row].title)"
        productTableaviewCell.categoryLabel.text = "\(products[indexPath.row].category)"
        productTableaviewCell.priceLabel.text = "$ \(products[indexPath.row].price)"
        productTableaviewCell.discountPercentageLabel.text = "Discount :\(products[indexPath.row].discountPercentage)"
        productTableaviewCell.ratingButtun.setTitle("\(products[indexPath.row].rating)", for: .normal)
      
        let imageUrl = products[indexPath.row].images.first!
        if let url = URL(string: imageUrl ) {
            productTableaviewCell.productImageView.kf.setImage(with: url)
        }else{
            print("invalid")
        }

        return productTableaviewCell
    }


}
extension SecondViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.00
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        
        thirdViewController.productContainer = products[indexPath.row]
        self.navigationController?.pushViewController(thirdViewController, animated: true)
    }
}

