//
//  JSON.swift
//  MTGET
//
//  Created by Jenith on 21/06/23.
//

import Foundation
import UIKit
import Alamofire
class info_fetch{
    var DataTobeFetched : [HomeData]?
    weak var vc: ViewController?
    weak var tc1: oneTableViewCell?
    weak var tc2: twoTableViewCell?
    weak var tc3: threeTableViewCell?
    
//parsing with Alamofire
    func ApiParsing(completion: @escaping () ->()){

        let url1 = URL(string: "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0")
        
        let task = AF.request(url1!).response{
        response in
        debugPrint("Response->>>",response)
        guard let data1 = response.data
                else
        {
            print("something went wrong")
            return
        }
        print("data fetched is:", data1)
        do{
            let responseData = try JSONDecoder().decode(Basedata.self, from: data1)
            self.DataTobeFetched = responseData.homeData
            print("result>>...",responseData)
            DispatchQueue.main.async {
                self.vc?.myTable1.reloadData()
                self.tc1?.collection1.reloadData()
                self.tc2?.collection2.reloadData()
                self.tc3?.collection3.reloadData()
            }
           
        completion()
    }
        catch{
            print(error)
        }
    }
    task.resume()
    }
    }
      




