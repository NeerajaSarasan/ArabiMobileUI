//
//  PreLoginPage.swift
//  ArabiMobile
//
//  Created by Neeraja Sarasan on 13/09/23.
//

import UIKit

class PreLoginPage: UIViewController {
    
    var passingData: (String, String)?
    
    @IBOutlet weak var preloginCountryFlagImage: UIImageView!
    @IBOutlet weak var preloginChangeCountryButton: UIButton!
    @IBOutlet weak var preloginCountryName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preloginCountryFlagImage.layer.cornerRadius = preloginCountryFlagImage.frame.width / 2
        preloginCountryName.text = CountryKey.Jordhan.localised
        preloginChangeCountryButton.titleLabel?.text = CountryKey.preloginChangeCountryButton.localised
        
        if let data = passingData {
            let (flagImageName, countryName) = data
            preloginCountryName.text = countryName
            preloginCountryFlagImage.image = UIImage(named: flagImageName)
        }
    }
    
}
