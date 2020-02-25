//
//  BasketViewController.swift
//  HomeWorkUISegmentControl
//
//  Created by Nikita Moskalenko on 2/9/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

final class BasketViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let buyButton = UIButton()
    private let imgOfProduct = UIImageView()
    private let backButton = UIButton()
    private let costLabel = UILabel()
    
    // MARK: - Public properties
    
    var chooseImg: UIImage?
    
    // MARK: - Constants
    
    enum textForBasketViewController {
        case buyButton
        case backButton
        case balanciageCost
        case nikeSupCost
        case nikeAirCost
        
        var text: String {
            switch self {
            case .buyButton:
                return "Buy"
            case .backButton:
                return "<Back"
            case .balanciageCost:
                return "300$"
            case .nikeSupCost:
                return "500$"
            case .nikeAirCost:
                return "400$"
            }
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        addSettingForBuyButton()
        addSettingForImfProduct()
        addSettingToBackButton()
        addSettingForCostLabel()
    }
    
    // MARK: - Private methods
    
    private func addSettingForBuyButton() {
        buyButton.frame = CGRect(x: 80, y: 750, width: 250, height: 50)
        buyButton.setTitle(textForBasketViewController.buyButton.text, for: .normal)
        buyButton.setTitleColor(.green, for: .normal)
        buyButton.backgroundColor = .darkGray
        buyButton.addTarget(self, action: #selector(fillingForm), for: .touchUpInside)
        
        view.addSubview(buyButton)
    }
    
    private func addSettingForImfProduct() {
        imgOfProduct.image = chooseImg
        imgOfProduct.frame = CGRect(x: 0, y: 0, width: 350, height: 270)
        imgOfProduct.center = view.center
        
        view.addSubview(imgOfProduct)
    }
    
    private func addSettingToBackButton() {
        backButton.frame = CGRect(x: 10, y: 10, width: 100, height: 40)
        backButton.setTitleColor(.green, for: .normal)
        backButton.setTitle(textForBasketViewController.backButton.text, for: .normal)
        backButton.backgroundColor = .darkGray
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        view.addSubview(backButton)
    }
    
    @objc
    private func goBack() {
        let previouseViewController = SelectionViewController()
        present(previouseViewController, animated: true)
    }
    
    private func addSettingForCostLabel() {
        costLabel.frame = CGRect(x: 35, y: 585, width: 100, height: 40)
        costLabel.backgroundColor = .darkGray
        costLabel.textColor = .green
        costLabel.textAlignment = .center
        
        view.addSubview(costLabel)
        
        switch imgOfProduct.image {
        case UIImage(named: "Balenciaga"):
            costLabel.text = textForBasketViewController.balanciageCost.text
        case UIImage(named: "NikaSup"):
            costLabel.text = textForBasketViewController.nikeSupCost.text
        case UIImage(named: "NikeAir"):
            costLabel.text = textForBasketViewController.nikeAirCost.text
        default:
            break
        }
     }
    
    @objc
    private func fillingForm() {
        let filFormViewController = FillFormViewController()
        filFormViewController.modalPresentationStyle = .fullScreen
//        present(filFormViewController, animated: true)
         navigationController?.pushViewController(filFormViewController, animated: true)
    }
}
