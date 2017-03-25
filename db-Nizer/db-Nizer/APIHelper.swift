//
//  APIHelper.swift
//  Delta
//
//  Created by jaswanth on 18/01/17.
//  Copyright © 2017 doodleblue. All rights reserved.
//

import UIKit
import Alamofire
import ReachabilitySwift


var baseURL = "http://35.154.131.230/delta_new/public/api/"
var imageAppedURL = "https://www.delta-dynamix.com/delta_new/storage/"
var responseDic = [String:Any]()
let reachability = Reachability()!
class APIHelper: NSObject {
    
    
    class func postData(urlString:String,parameters:[String:Any], completion:@escaping(_ response:[String:Any]?)->Void)->Void {
        
        if reachability.isReachable {
            request(urlString, method: .post, parameters: parameters as! Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
                print(response)
                switch(response.result) {
                case .success(_):
                    if let data  = response.result.value{
                        print(data)
                        var response = response.result.value as! [String:Any]!
                        print(response as [String:Any]!)
                       completion((data as? [String:Any])!)
                        
                    }
                    break
                    
                case .failure(_):
                    print(response.result.error)
                    NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
                    
                    break
                    
                }
            }
        } else {
            print("Network not reachable")
        }
        
        
    }
    
    
    class func postData(urlString:String,parameters:[String:Any],headers:[String:String], completion:@escaping(_ response:[String:Any]?)->Void)->Void {
        
        if reachability.isReachable {
            request(urlString, method: .post, parameters: parameters as! Parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
                print(response)
                
                
                switch(response.result) {
                case .success(_):
                    if let data  = response.result.value{
                        print(data)
                        
                        var response = response.result.value as! [String:Any]!
                        print(response as [String:Any]!)
                        if  response?["status"] as! NSNumber == 401{
                          //  AccesTokenModel.sharedInstance.popToRootView()
                            
                        } else {
                            completion((data as? [String:Any])!)
                        }

                    }
                    break
                    
                case .failure(_):
                    //print(response.result.error)
                     NotificationCenter.default.post(name: Notification.Name("NotificationIdentifier"), object: nil)
                    break
                    
                }
            }
        } else {
             print("Network not reachable")
        }
        
    
        
    }
    
    
    
       
    
    
    class func getData(urlString:String, completion:@escaping(_ response:[String:Any]?)->Void)->Void {
        
        request(urlString, method: .get, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    print(response.result.value)
                     completion((data as? [String:Any])!)
                }
                break
                
            case .failure(_):
                print(response.result.error)
                break
                
            }
        }
        
    }
    
    
    
    
 
    
    
    
    
    
    
    
    
}
