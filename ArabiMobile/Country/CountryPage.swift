//
//  CountryPage.swift
//  ArabiMobile
//
//  Created by Neeraja Sarasan on 14/09/23.
//

import UIKit

class CountryPage: UIViewController {
    
    @IBOutlet weak var chooseCountry: UILabel!
    @IBOutlet weak var countryPageTableView: UITableView!
    
    var selectedIndexPath: IndexPath?
    
    let countries = [
        ("JordhanFlag", CountryKey.Jordhan.localised),
        ("PalestineFlag", CountryKey.Palestine.localised),
        ("EgyptFlag", CountryKey.Egypt.localised),
        ("LebanonFlag", CountryKey.Lebanon.localised),
        ("UAEFlag", CountryKey.UAE.localised),
        ("QatarFlag", CountryKey.Qatar.localised),
        ("BaharainFlag", CountryKey.Baharain.localised),
        ("AlgeriaFlag", CountryKey.Algeria.localised)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPageTableView.dataSource = self
        countryPageTableView.delegate = self
        countryPageTableView.register(UINib(nibName: "CountrySelection", bundle: nil), forCellReuseIdentifier: "selectCountry")
        // countryPageTableView.separatorStyle = .singleLine
        // countryPageTableView.separatorColor = .clear
        chooseCountry.text = CountryKey.chooseCountry.localised
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoPrelogin" {
            if let indexPath = countryPageTableView.indexPathForSelectedRow {
                let selectedData = countries[indexPath.row]
                if let preloginViewController = segue.destination as? PreLoginPage {
                    preloginViewController.passingData = selectedData
                }
            }
        }
    }
}

extension CountryPage: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"selectCountry", for: indexPath ) as! CountrySelection
        let (imageName, labelText) = countries[indexPath.row]
        cell.countrySelectionImage.image = UIImage(named: imageName)
        cell.countrySelectionLabel.text = labelText
        cell.countrySelectionImage.layer.cornerRadius = cell.countrySelectionImage.frame.width / 2.0
        cell.countrySelectionImage.clipsToBounds = true
        cell.layer.cornerRadius = 22
        cell.layer.borderColor = UIColor.gray.cgColor
        cell.layer.borderWidth = 0.5
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        if let cell = tableView.cellForRow(at: indexPath) as? CountrySelection {
            cell.layer.borderWidth = 2.0
            cell.layer.borderColor = UIColor.gray.cgColor
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        if let cell = tableView.cellForRow(at: indexPath) as? CountrySelection {
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let selectedIndexPaths = tableView.indexPathsForSelectedRows,
           selectedIndexPaths.contains(indexPath) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}



