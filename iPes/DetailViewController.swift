//
//  DetailViewController.swift
//  iPes
//
//  Created by Matej Svrznjak on 14/05/2016.
//  Copyright © 2016 Matej Svrznjak. All rights reserved.
//

import UIKit

final class DetailControllerView: UIView {
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var taxNumberLabel: UILabel!
    @IBOutlet var shortNameLabel: UILabel!
    @IBOutlet var idNumberLabel: UILabel!
    @IBOutlet var addressStreetLabel: UILabel!
    @IBOutlet var addressMunicipalityLabel: UILabel!
    @IBOutlet var addressPostLabel: UILabel!
    @IBOutlet var addressPostNumberLabel: UILabel!
    @IBOutlet var bankAccountsLabel: UILabel!
    @IBOutlet var bankAccountTitleLabel: UILabel!
    @IBOutlet var shortNameTitleLabel: UILabel!
    @IBOutlet var addressMunicipalityTitleLabel: UILabel!
    @IBOutlet var idNumberTitleLabel: UILabel!
    @IBOutlet var addressPostNumberTitleLabel: UILabel!
}

class DetailViewController: UIViewController {
    var nativeView: DetailControllerView! {
        return self.view as! DetailControllerView
    }

    var company: Company!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.company.shortName

        self.nativeView.fullNameLabel.text = self.company.fullName
        self.nativeView.shortNameLabel.text = self.company.shortName
        
        if let taxNumber = self.company.taxNumber {
            self.nativeView.taxNumberLabel.text = "\(taxNumber)"
        }
        
        self.nativeView.idNumberLabel.text = self.company.idNumber
        
        if let addressStreet = self.company.addressStreet, addressHouseNumber = self.company.addressHouseNumber {
            self.nativeView.addressStreetLabel.text = "\(addressStreet) \(addressHouseNumber)"
        }
        
        self.nativeView.addressMunicipalityLabel.text = self.company.addressMunicipality
        self.nativeView.addressPostLabel.text = self.company.addressPost
        self.nativeView.addressPostNumberLabel.text = self.company.addressPostNumber
        
        if let bankAccounts = self.company.bankAccounts {
            if bankAccounts.count < 1 {
                self.nativeView.bankAccountTitleLabel.hidden = true
                self.nativeView.bankAccountsLabel.hidden = true
                return
            }
            
            self.nativeView.bankAccountTitleLabel.text = bankAccounts.count == 1 ? "Transakcijski račun:" : "Transakcijski računi:"
            
            var bankAccountsString = ""

            for account in bankAccounts {
                let iban = account["iban"] as! String
                let accountNumber = account["account_number"] as! String

                bankAccountsString += "\(iban) \(accountNumber)\n"
            }
            
            self.nativeView.bankAccountsLabel.text = bankAccountsString
        }
    }
}