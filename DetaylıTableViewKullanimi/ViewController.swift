//
//  ViewController.swift
//  DetaylıTableViewKullanimi
//
//  Created by Berk on 27.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemek = [Yemekler]()
    
    var yemekDetails : Yemekler?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        let y1 = Yemekler(yemekId: 1, yemekAdi: "Ayran", yemekResimAdi: "ayran", yemekFiyat: 12.99)
        let y2 = Yemekler(yemekId: 2, yemekAdi: "Baklava", yemekResimAdi: "baklava", yemekFiyat: 7.66)
        let y3 = Yemekler(yemekId: 3, yemekAdi: "Fanta", yemekResimAdi: "fanta", yemekFiyat: 4.44)
        let y4 = Yemekler(yemekId: 4, yemekAdi: "Izgara Somon", yemekResimAdi: "izgarasomon", yemekFiyat: 20.12)
        let y5 = Yemekler(yemekId: 5, yemekAdi: "Izgara Tavuk", yemekResimAdi: "izgaratavuk", yemekFiyat: 22.44)
        let y6 = Yemekler(yemekId: 6, yemekAdi: "Kadayıf", yemekResimAdi: "kadayif", yemekFiyat: 2.44)
        let y7 = Yemekler(yemekId: 7, yemekAdi: "Kahve", yemekResimAdi: "kahve", yemekFiyat: 1.44)
        
        yemek.append(y1)
        yemek.append(y2)
        yemek.append(y3)
        yemek.append(y4)
        yemek.append(y5)
        yemek.append(y6)
        yemek.append(y7)
        
    }

}

extension ViewController:UITableViewDelegate, UITableViewDataSource, YemekTableViewCellProtocol {
    
    
    func siparisVer(indexPath: IndexPath) {
        
        yemekDetails = yemek[indexPath.row]
        
        print("\(yemek[indexPath.row].yemekAdi!) Yemeğin adı, \(yemek[indexPath.row].yemekFiyat!) fiyatı. Siparişiniz alınmıştır.")
        
        performSegue(withIdentifier: "detaySayfa", sender: nil)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let veri = yemek[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "yemekHucre", for: indexPath) as! YemekTableViewCell
        
        cell.yemekAdiLabel.text = veri.yemekAdi
        cell.yemekFiyatLabel.text = "\(veri.yemekFiyat!) TL"
        cell.yemekImage.image = UIImage(named: veri.yemekResimAdi!)
        
        cell.hucreProtocol = self
        cell.hucreIndex = indexPath
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detaySayfa" {
            
            let veriSegue = segue.destination as! DetayPageViewController
            
            veriSegue.detay = yemekDetails
            
            
        }
        
    }
    
    
    
    
}

