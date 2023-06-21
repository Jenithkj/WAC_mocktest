//
//  twoTableViewCell.swift
//  MTGET
//
//  Created by Jenith on 21/06/23.
//

import UIKit

class twoTableViewCell: UITableViewCell {

    @IBOutlet weak var collection2: UICollectionView!
    
    var vDisplay2:[HomeData] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collection2.dataSource = self
        collection2.delegate = self
        collection2.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension twoTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vDisplay2[1].values!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "twoC", for: indexPath) as! twoCollectionViewCell
                    let imageUrl = URL(string: (vDisplay2[1].values![indexPath.row].banner_url)!)
                    let imgData = try? Data(contentsOf: imageUrl!)
        cell.image2.image = UIImage(data: imgData!)
                    return cell
    }
    
    
}
