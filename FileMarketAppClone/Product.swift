//
//  Product.swift
//  FileMarketAppClone
//
//  Created by Bilge Çakar on 11.03.2022.
//

import Foundation

class Product
{
    var image : String?
    var category : String?
    
    init(image : String)
    {
        self.image = image
    }
    
    init(image : String, category :String)
    {
        self.image = image
        self.category = category
    }
    
}
