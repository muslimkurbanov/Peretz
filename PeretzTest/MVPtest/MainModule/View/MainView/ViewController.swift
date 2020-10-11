//
//  ViewController.swift
//  MVPtest
//
//  Created by Муслим Курбанов on 20.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var presenter: ViewPresetnerProtocol!
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.title = "Peretz"
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "arrow-left")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "arrow-left")
        // Do any additional setup after loading the view.
        print(UserSettings.productCount)
    }
    
    //MARK: - IBActions
    @IBAction func goToMenuScreenButton(sender: Any) {
//        let tb = TableViewController()
//        let vc = ModuleBuilder.createTableViewModule()
//        navigationController?.pushViewController(vc, animated: true)
        
        let tableViewCell = TableViewCell()
        UserSettings.productCount = tableViewCell.productCountValue
        print(UserSettings.productCount)
//        tableViewCell.productCountValue =
    }
    
    
}
//MARK: - ViewProtocol
extension ViewController: ViewProtocol {
    func configurate(viewController: ViewController) {
        
    }
    
}

