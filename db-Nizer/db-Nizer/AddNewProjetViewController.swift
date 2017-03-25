//
//  AddNewProjetViewController.swift
//  db-Nizer
//
//  Created by jaswanth on 25/03/17.
//  Copyright © 2017 doodleblue. All rights reserved.
//

import UIKit
import Alamofire
class AddNewProjetViewController: UIViewController {
    @IBOutlet weak var pNametextField:UITextField!
    @IBOutlet weak var projectMangerNametextField:UITextField!
    @IBOutlet weak var clientNametextField:UITextField!
    @IBOutlet weak var clientEmailidtextField:UITextField!
    @IBOutlet weak var clientbudgettextField:UITextField!
    @IBOutlet weak var iternaltextField:UITextField!
    @IBOutlet weak var clienttimelientextField:UITextField!
    @IBOutlet weak var internaltimelinetextField:UITextField!
    @IBOutlet weak var officialStartDatetextField:UITextField!
    @IBOutlet weak var typetextField:UITextField!
    @IBOutlet weak var platformstextField:UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back (_ sender:UIButton){
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addProjectApi(_ sender:UIButton){
        if sender.titleLabel?.text == "Add"{
            sender.setTitle("Done", for: .normal)
            let para = ["clientEmail":clientEmailidtextField.text!,
                        "clientName":clientNametextField.text!,
                        "projectName":pNametextField.text!,
                        //"projectmanagerId":"asdasdsad",
                "projectManagerName":projectMangerNametextField.text!,
                "adminBudget":clientbudgettextField.text!,
                "internalBudget":iternaltextField.text!,
                "clientTimeline":clienttimelientextField.text!,
                "internalTimeline":internaltimelinetextField.text!,
                "officialStartDate":officialStartDatetextField.text!,
                "type":typetextField.text!,
                "platform":platformstextField.text!]
            
            APIHelper.postData(urlString: "http://192.169.164.224:8280/addProject", parameters: para) { (data) in
                
                var response = data as [String:Any]!
                print(response as [String:Any]!)
                if  response?["status"] as! NSNumber == 0{
                    let alert:UIAlertController=UIAlertController(title: "Success", message: nil, preferredStyle: UIAlertControllerStyle.alert)
                    let cameraAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.default)
                    {
                        UIAlertAction in
                        let _ = self.navigationController?.popViewController(animated: true)
                    }
                    
                    alert.addAction(cameraAction)
                    
                    self.present(alert, animated: true, completion: nil)

                }
               
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
