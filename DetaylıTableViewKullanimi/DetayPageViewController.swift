//
//  DetayPageViewController.swift
//  DetaylıTableViewKullanimi
//
//  Created by Berk on 27.09.2023.
//

import UIKit

class DetayPageViewController: UIViewController {
    
    
    @IBOutlet weak var detayImage: UIImageView!
    @IBOutlet weak var detayIsim: UILabel!
    @IBOutlet weak var detayFiyat: UILabel!
    
    var detay:Yemekler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detayIsim.text = detay?.yemekAdi
        detayFiyat.text = "\(detay?.yemekFiyat ?? 99.99)"
        detayImage.image = UIImage(named: "\(detay?.yemekResimAdi ?? "Boş")")
        
        
    }
    

    

}
