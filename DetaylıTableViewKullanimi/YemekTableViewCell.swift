//
//  YemekTableViewCell.swift
//  DetaylıTableViewKullanimi
//
//  Created by Berk on 27.09.2023.
//

import UIKit

protocol YemekTableViewCellProtocol {
    
    func siparisVer(indexPath: IndexPath)
    
}

class YemekTableViewCell: UITableViewCell {
    
    @IBOutlet weak var yemekImage: UIImageView!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    
    var hucreProtocol:YemekTableViewCellProtocol?
    var hucreIndex:IndexPath?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func siparisVerButton(_ sender: Any) {
        
        hucreProtocol?.siparisVer(indexPath: hucreIndex!)
        
    }
    

}
