//
//  priceGoldViewController.swift
//  gold
//
//  Created by Admin on 21/7/2562 BE.
//  Copyright © 2562 Kate. All rights reserved.
//

import UIKit
import Firebase
import Alamofire
import SwiftyJSON

struct post: Codable {
    let buy: String
    let sell: String
    let spotPrice: String
    let timeStamp: String
    
}

class priceGoldViewController: UIViewController {
    
    @IBOutlet weak var buyLabel: UILabel!

    var outputStr = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    
    func getdata(){
        let jsonUrlString = "https://firebasestorage.googleapis.com/v0/b/gold-10b84.appspot.com/o/spot_price.json?alt=media&token=b16de68c-8b53-4740-956e-9d79a1b3e212"
        guard let url = URL(string: jsonUrlString) else
        { return }
        
        URLSession.shared.dataTask(with: url) {(data, response, err) in

            guard let data = data else { return }
            do{
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
                print("test",json)
                
                
                //Decode
                let JSONData = try JSONDecoder().decode(post.self, from: data)
                
                self.outputStr += "buy: " + JSONData.buy + "\n"
                self.outputStr +=  "sell: " + JSONData.sell + "\n"
                self.outputStr += "spotPrice: " + JSONData.spotPrice + "\n"
                self.outputStr += "timeStamp: " + JSONData.timeStamp + "\n"
                
                DispatchQueue.main.async {
                    self.buyLabel!.text = self.outputStr
                }
                
            } catch let jsonError{
                print("Error seriallizing json:", jsonError)
            }
            
            }.resume()
    }

}
