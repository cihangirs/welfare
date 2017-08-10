//
//  ViewController.swift
//  welfare
//
//  Created by Cihangir Sungur on 07/08/2017.
//  Copyright © 2017 Cihangir Sungur. All rights reserved.
//

import UIKit
import Alamofire
import Crashlytics

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
//    var url: String?
//    var url = "https://demo3033169.mockable.io/products"
    let url = "https://demo3033169.mockable.io/products"
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let button = UIButton(type: .roundedRect)
//        button.frame = CGRect(x: 20, y: 50, width: 100, height: 30)
//        button.setTitle("Crash", for: [])
//        button.addTarget(self, action: #selector(self.crashButtonTapped(_:)), for: .touchUpInside)
//        view.addSubview(button)

        makeRequest()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func crashButtonTapped(_ sender: Any) {
        Crashlytics.sharedInstance().crash()
    }
    
    func makeRequest() {
        
//        let headers: HTTPHeaders = [
//            "Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==",
//            "Accept": "application/json"
//        ]
        
//        Alamofire.request(url).validate().responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")
//
//            debugPrint("All Response Info: \(response)")
//        
//            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
//            }
//        
//            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)") // original server data as UTF8 string
//            }
//        }

//        Alamofire.request(url).validate().responseString { response in
//            print("Success: \(response.result.isSuccess)")
//            print("Response String: \(String(describing: response.result.value))")
//        }
        
//        Alamofire.request(url, method: .get).responseJSON { response in
//        Alamofire.request(url).validate(statusCode: 200..<300).validate(contentType: ["application/json"])
        Alamofire.request(url).authenticate(user: "cihangir", password: "12345678").validate().responseJSON { response in
            
            switch response.result {
            case .success:
                
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")
                
                debugPrint("All Response Info: \(response)")
                
                if let json = response.result.value {
                    print("JSON: \(json)") // serialized json response
                }
                
                if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                    print("Data: \(utf8Text)") // original server data as UTF8 string
                }
                
                print("Validation Successful")
            
            case .failure(let error):
                print(error)
            }
        }
        
//        Alamofire.request(url).validate().responseString { response in
//            print("Success: \(response.result.isSuccess)")
//            print("Response String: \(String(describing: response.result.value))")
//        }
        
        
        let utilityQueue = DispatchQueue.global(qos: .utility)
        
        Alamofire.download("https://httpbin.org/image/png")
            .downloadProgress(queue: utilityQueue) { progress in
                print("Download Progress: \(progress.fractionCompleted)")
            }
            .responseData { response in
                if let data = response.result.value {
                    let image = UIImage(data: data)
                    self.imageView.image = image;
                }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
