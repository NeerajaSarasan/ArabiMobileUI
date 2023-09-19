//
//  String.swift
//  ArabiMobile
//
//  Created by Neeraja Sarasan on 15/09/23.

import Foundation

enum CountryKey: String {
    
    case preloginChangeCountryButton = "Change Country"
    case preloginCountryLabel = "ChangeCountryLabel"
    case chooseCountry = "Choose the country"
    case Jordhan = "Jordhan"
    case Palestine = "Palestine"
    case Egypt = "Egypt"
    case Lebanon = "Lebanon"
    case UAE =  "United Arab Emirates"
    case Qatar = "Qatar"
    case Baharain = "Baharain"
    case Algeria =  "Algeria"
    
    var localised: String {
        NSLocalizedString(String(describing: self.self) + "_\(rawValue)", comment: "")
    }
    
}
