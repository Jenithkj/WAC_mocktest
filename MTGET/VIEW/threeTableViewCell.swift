//
//  threeTableViewCell.swift
//  MTGET
//
//  Created by Jenith on 21/06/23.
//

import UIKit

class threeTableViewCell: UITableViewCell {

    @IBOutlet weak var collection3: UICollectionView!
    var vDisplay3:[HomeData] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collection3.delegate = self
        collection3.dataSource = self
        collection3.reloadData()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension threeTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vDisplay3[2].values!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "threeC", for: indexPath) as! threeCollectionViewCell
                    let imageUrl = URL(string: (vDisplay3[2].values![indexPath.row].image)!)
                    let imgData = try? Data(contentsOf: imageUrl!)
        cell.image3.image = UIImage(data: imgData!)
        cell.actualPrice1.text = vDisplay3[2].values![indexPath.row].actual_price
        cell.discountedPrice.text = vDisplay3[2].values![indexPath.row].offer_price
        cell.description1.text = vDisplay3[2].values![indexPath.row].name
       
        
                    return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 170, height: 500)
        }
    }

