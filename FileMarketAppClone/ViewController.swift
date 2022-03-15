//
//  ViewController.swift
//  FileMarketAppClone
//
//  Created by Bilge Çakar on 10.03.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var productList = [Product]()
    var categoryList = [Product]()

    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        //Navigationbar a logo ekleme
        let logo = UIImage(named: "FileLogo.png")
        let imageView = UIImageView(image:logo )
        navigationItem.titleView = imageView
                
        //Collectionview slider
        let banner1 = Product(image: "Banner-1")
        let banner2 = Product(image: "Banner-2")
        let banner3 = Product(image: "Banner-3")
        let banner4 = Product(image: "Banner-4")
        productList.append(banner1)
        productList.append(banner2)
        productList.append(banner3)
        productList.append(banner4)
                
        //Category collectionview
        let category1 = Product(image: "Domates", category: "Meyve Sebze")
        let category2 = Product(image: "Et", category: "Et Tavuk Balık")
        let category3 = Product(image: "Icecek", category: "İçecek")
        let category4 = Product(image: "Kahvalti", category: "Kahvaltılık Şarküteri")
        let category5 = Product(image: "Sut", category: "Süt ve Süt Ürünleri")
        let category6 = Product(image: "Makarna", category: "Temel Gıda")
        let category7 = Product(image: "Ekmek", category: "Fırın Pastane")
        let category8 = Product(image: "Cips", category: "Atıştırmalık")
        let category9 = Product(image: "Sandvic", category: "Hazır Yemek")
        let category10 = Product(image: "Dondurma", category: "Dondurma")
        let category11 = Product(image: "Disfircasi", category: "Kişisel Bakım")
        let category12 = Product(image: "Temizlik", category: "Ev Temizliği")
        let category13 = Product(image: "Bebek", category: "Bebek")
        let category14 = Product(image: "Hayvan", category: "Evcil Dostlar")
        categoryList.append(category1)
        categoryList.append(category2)
        categoryList.append(category3)
        categoryList.append(category4)
        categoryList.append(category5)
        categoryList.append(category6)
        categoryList.append(category7)
        categoryList.append(category8)
        categoryList.append(category9)
        categoryList.append(category10)
        categoryList.append(category11)
        categoryList.append(category12)
        categoryList.append(category13)
        categoryList.append(category14)
                
        //Category collectionview tasarim
        let categoryTasarim = UICollectionViewFlowLayout()
        categoryTasarim.sectionInset = UIEdgeInsets(top: 15, left: 10, bottom: 10, right: 10)
        categoryTasarim.minimumLineSpacing = 10 //Dikey
        categoryTasarim.minimumInteritemSpacing = 5 //Yatay
        let genislik = categoryCollectionView.frame.size.width
        let hucreGenislik = (genislik-40) / 3
        categoryTasarim.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.2)
        categoryCollectionView.collectionViewLayout = categoryTasarim
        
        //Banner collectionview tasarim
        let bannerTasarim = UICollectionViewFlowLayout()
        bannerTasarim.scrollDirection = .horizontal
        bannerTasarim.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        bannerTasarim.minimumLineSpacing = 0 //Dikey
        bannerTasarim.minimumInteritemSpacing = 0 //Yatay
        bannerTasarim.itemSize = CGSize(width: imageCollectionView.frame.size.width, height: imageCollectionView.frame.size.height)
        imageCollectionView.collectionViewLayout = bannerTasarim
                
        pageController.numberOfPages = productList.count
    
    }
    
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imageCollectionView
        {
            return productList.count
        }
        return categoryList.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == imageCollectionView
        {   let product = productList[indexPath.row]
            let cellA = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! ImageCollectionViewCell
            
            cellA.layer.cornerRadius = 20
            cellA.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
            
            cellA.productImage.image = UIImage(named: product.image!)
            
            return cellA
        }else{
            let category = categoryList[indexPath.row]
            let cellB = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
            
            cellB.categoryImageView.image = UIImage(named: category.image!)
            cellB.categoryNameLabel.text = "\(category.category!)"
            cellB.layer.borderColor = UIColor.white.cgColor
            cellB.layer.borderWidth = 0.3
            cellB.layer.cornerRadius = 10
            
            return cellB
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if collectionView == imageCollectionView
        {
            pageController.currentPage = indexPath.row
        }
        
    }
    
}




