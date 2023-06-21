//
//  oneTableViewCell.swift
//  MTGET
//
//  Created by Jenith on 21/06/23.
//

import UIKit

class oneTableViewCell: UITableViewCell {

    @IBOutlet weak var collection1: UICollectionView!
    var temp2  = info_fetch.self
    var vDisplay1:[HomeData] = []
    weak var vc: ViewController?
    weak var mainTable: oneTableViewCell?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       collection1.dataSource = self
       collection1.delegate = self
        collection1.reloadData()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension oneTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "oneC", for: indexPath) as! oneCollectionViewCell
        cell.label1.text = vDisplay1[0].values![indexPath.row].name
                        let imageUrl = URL(string: (vDisplay1[0].values![indexPath.row].image_url)!)
                        let imgData = try? Data(contentsOf: imageUrl!)
        cell.image1.image = UIImage(data: imgData!)
        cell.roundedView.layer.cornerRadius = 25
           
                        return cell
       
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return vDisplay1[0].values!.count
    }
    
        
        
       
    }
