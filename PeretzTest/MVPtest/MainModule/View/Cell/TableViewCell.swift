//
//  TableViewCell.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 20.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit
import SDWebImage

protocol UserSettingsProtocol: class {
    func setUserSettings(userSettings: UserSettings)
}


class TableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var minusButtonOutlet: UIButton!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    
    //variables
    var countValue = 0
    var presenter: TableViewCellPresetnerProtocol!
    var searchResponce: [Model]? = nil
    var model: Model?
    
    var productCountValue: String = ""
    
    var productCountState: Bool = true
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        countLabel.text = productCountValue
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        minusButtonOutlet.isHidden = true
        countLabel.isHidden = productCountState
    }
    
    func configurate(wtih model: Model) {
        self.model = model
        
        nameLabel.text = model.name
        priceLabel.text = "\(model.price) ₽"
        descriptionLabel.text = model.description
        productImageView.sd_setImage(with: URL(string: model.image), completed: nil)
    }
    
    //MARK: - IBActions
    @IBAction func minusButton(_ sender: Any) {
        if countValue >= 1 {
            countValue -= 1
            countLabel.text = String(countValue)
            UserSettings.productCount = countLabel.text
            countLabel.text = UserSettings.productCount
            print(UserSettings.productCount)
        } else { return }
        
        if countValue == 0 {
            minusButtonOutlet.isHidden = productCountState
            countLabel.isHidden = productCountState
        }
    }
    
    @IBAction func plusButton(_ sender: Any) {
        if countValue == 0 {
            minusButtonOutlet.isHidden = false
            countLabel.isHidden = false
        }
        
        if countValue <= 98 {
            countValue += 1
            countLabel.text = String(countValue)
            UserSettings.productCount = String(countValue) ?? "No value"
            countLabel.text = UserSettings.productCount
            print(UserSettings.productCount)

        } else { return }
        
    }
}

extension TableViewCell: UserSettingsProtocol {
    func setUserSettings(userSettings: UserSettings) {
        
    }
    
    
}

