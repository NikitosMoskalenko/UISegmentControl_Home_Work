//
//  ViewController.swift
//  HomeWorkUISegmentControl
//
//  Created by Nikita Moskalenko on 2/9/20.
//  Copyright © 2020 Nikita Moskalenko. All rights reserved.
//

import UIKit

final class SelectionViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let productsImage = UIImageView()
    private let topLabel = UILabel()
    private var productsSegmantControl = UISegmentedControl()
    private let selectionButton = UIButton()
    let basketVC = BasketViewController()
    
    // MARK: - Constants
    
    private var imgForBackground = UIImage(named: "background")
    private var productsImagesArray = [UIImage(named: "Balenciaga"),
                                       UIImage(named: "NikaSup"),
                                       UIImage(named: "NikeAir")]
    
    
    enum textForUIElements {
        case topLabelText
        case firstSegment
        case secondSegment
        case thirdSegment
        case buttonText
        case alertTitle
        case alertMessage
        case alertActionTitle
        
        var text: String {
            switch self {
            case .topLabelText:
                return "Choose a product:"
            case .firstSegment:
                return "First"
            case .secondSegment:
                return "Second"
            case .thirdSegment:
                return "Third"
            case .buttonText:
                return "To basket"
            case .alertTitle:
                return "STOP!"
            case .alertMessage:
                return "Pleas choice a product"
            case .alertActionTitle:
                return "OK"
            }
        }
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewSet()
        addSettingToLabel()
        addSettingToProductsImage()
        addSettingToProdutsSegmentControl()
        addSettingToSelectionButton()
    }

    // MARK: - Private methods

    
    private func viewSet() {
        if let backgroundIMG = imgForBackground {
            view.backgroundColor = UIColor(patternImage: backgroundIMG)
        }
    }
    
    private func addSettingToLabel() {
        topLabel.frame = CGRect(x: 80, y: 50, width: 250, height: 50)
        topLabel.textAlignment = .center
        topLabel.textColor = .green
        topLabel.font = topLabel.font.withSize(30)
        topLabel.text = textForUIElements.topLabelText.text
        
        view.addSubview(topLabel)
    }
    
    private func addSettingToProductsImage() {
        productsImage.frame = CGRect(x: 0, y: 0, width: 350, height: 270)
        productsImage.center = view.center
        productsImage.image = productsImagesArray[0]
        productsImage.isHidden = true
        
        view.addSubview(productsImage)
    }
    
    private func addSettingToProdutsSegmentControl() {
        productsSegmantControl = UISegmentedControl(items: [textForUIElements.firstSegment.text,
                                                            textForUIElements.secondSegment.text,
                                                            textForUIElements.thirdSegment.text])
        productsSegmantControl.frame = CGRect(x: 100, y: 650, width: 200, height: 40)
        productsSegmantControl.addTarget(self, action: #selector(changeImg(sender:)), for: .valueChanged)
        productsSegmantControl.backgroundColor = .darkGray
        productsSegmantControl.selectedSegmentTintColor = .lightGray
        productsSegmantControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], for: .normal)
        
        view.addSubview(productsSegmantControl)
    }
    
    private func addSettingToSelectionButton() {
        selectionButton.frame = CGRect(x: 80, y: 750, width: 250, height: 50)
        selectionButton.setTitle(textForUIElements.buttonText.text, for: .normal)
        selectionButton.setTitleColor(.green, for: .normal)
        selectionButton.backgroundColor = .darkGray
        selectionButton.addTarget(self, action: #selector(segueToBasket), for: .touchUpInside)
        
        view.addSubview(selectionButton)
    }
    
//  условие товар появляется при выборе сегмента
    @objc
    func changeImg(sender: UISegmentedControl) {
        if sender == productsSegmantControl {
            let segmentElement = sender.selectedSegmentIndex
            productsImage.image = productsImagesArray[segmentElement]
            productsImage.isHidden = false
            
            if let prodIMG = productsImagesArray[segmentElement] {
                basketVC.chooseImg = prodIMG
            }
        }
    }
    
//  создаем условие для перехода в "Корзину", только в том случае, если выбран какой-либо товар
    @objc
    private func segueToBasket() {
        switch productsSegmantControl.selectedSegmentIndex {
        case 0...2:
            basketVC.modalPresentationStyle = .fullScreen
//          present(basketVC, animated: true)
            navigationController?.pushViewController(basketVC, animated: true)
        default:
            let alert = UIAlertController(title: textForUIElements.alertTitle.text, message: textForUIElements.alertMessage.text, preferredStyle: .alert)
            let action = UIAlertAction(title: textForUIElements.alertActionTitle.text, style: .cancel, handler: nil)
            
            alert.addAction(action)
            present(alert, animated: true)
        }
    }
}



