//
//  FirstViewController.swift
//  db-Nizer
//
//  Created by jaswanth on 25/03/17.
//  Copyright © 2017 doodleblue. All rights reserved.
//

import UIKit
import SwiftyJSON
class FirstViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
           }
    
    
    
    @IBAction func loginButtonActio(_ sender:UIButton){
        let loginPageView = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        if sender.tag == 0 {
           loginPageView.isAdmain = true
        } else {
            loginPageView.isAdmain = false
        }
        
       
      
        self.navigationController?.pushViewController(loginPageView, animated: false)
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
