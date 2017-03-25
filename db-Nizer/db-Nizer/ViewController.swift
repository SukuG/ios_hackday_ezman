//
//  ViewController.swift
//  db-Nizer
//
//  Created by jaswanth on 25/03/17.
//  Copyright © 2017 doodleblue. All rights reserved.
//

import UIKit
import SwiftyJSON
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var data2 = [String]()
    var projectName = [String]()
    var projectinDate = [String]()
    var projectstatus = [String]()
    var projectMangerName = [String]()
    
    var isAdmain = Bool()
    @IBOutlet weak var projectList:UITableView!
    @IBOutlet weak var addProjectButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        if isAdmain == true {
            addProjectButton.isHidden = false
        } else {
            addProjectButton.isHidden = true
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        APIHelper.getData(urlString: "http://192.169.164.224:8280/getProJectDetails") { (data) in
            print(data)
            var response = data as [String:Any]!
            print(response as [String:Any]!)
            if  response!.count > 0 {
                let data = response?["data"] as! [String:Any]!
                print(data)
                let projectDetails = data?["projectdetails"] as! [[String:Any]]
                print(JSON(projectDetails))
                self.data2 = projectDetails.map({ $0["projectName"] as! String
                })
                self.projectMangerName = projectDetails.map({ $0["projectManagerName"] as! String
                })
                
                self.projectinDate = projectDetails.map({ $0["officialStartDate"] as! String
                })
                
                print(self.data2.count)
                print(self.projectMangerName)
                print(self.projectMangerName.count)
                print(self.projectinDate.count)
                self.projectList.reloadData()
                
                
            }
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data2.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Getting the right element
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! projectsListTableViewCell
        cell.ProjectNameLabel.text = data2[indexPath.row]
        cell.projectMANGERNAME.text = projectMangerName[indexPath.row]
        cell.projectSatrtDateLabel.text = projectinDate[indexPath.row]
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let loginPageView = self.storyboard?.instantiateViewController(withIdentifier: "addTaskViewController") as! addTaskViewController
        
        self.navigationController?.pushViewController(loginPageView, animated: false)
    }
    
    @IBAction func addProject(_ sender:UIButton){
        
        
            let loginPageView = self.storyboard?.instantiateViewController(withIdentifier: "AddNewProjetViewController") as! AddNewProjetViewController
            
            self.navigationController?.pushViewController(loginPageView, animated: false)
    
        
    }


}

