//
//  ViewController.swift
//  MTGET
//
//  Created by Jenith on 21/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTable1: UITableView!
//    weak var secondTable: oneTableViewCell?
//    weak var thirdtable: threeTableViewCell?
    

    var tempInfo1  = info_fetch()

    var vDisplay4:[HomeData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    myTable1.dataSource = self
    myTable1.delegate = self
    tempInfo1.vc = self
    tempInfo1.ApiParsing {
        self.vDisplay4 = self.tempInfo1.DataTobeFetched ?? []
        }
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return vDisplay4.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "oneT", for: indexPath) as! oneTableViewCell
            cell.vDisplay1 = self.vDisplay4
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "twoT", for: indexPath) as! twoTableViewCell
            cell.vDisplay2 = self.vDisplay4
            return cell
        }else if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: "threeT", for: indexPath) as! threeTableViewCell
            cell.vDisplay3 = self.vDisplay4
            return cell
        }else{
            return UITableViewCell()
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 150
        }else if indexPath.row == 1{
            return 200
        }else if indexPath.row == 2{
            return 350
        }else{
            return 0
        }
        
    }
    
   
}
