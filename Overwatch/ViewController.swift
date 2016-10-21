//
//  ViewController.swift
//  Overwatch
//
//  Created by Jim Campagno on 10/9/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import UIKit


var game = Game()

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var characterScroll: UIScrollView!
    
    @IBOutlet weak var characterImageStack: UIStackView!
    

    @IBOutlet weak var characterNameLabel: UILabel!
    
    var characterImages = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterImageStack.translatesAutoresizingMaskIntoConstraints = false
        updateViews()
    }
    
    func updateViews() {
        characterImages.removeAll()
        
        switch game.heroType {
        case .offense:
            for character in game.offenseCharacters {
                let imageView = UIImageView()
                imageView.image = character.profileImage
                characterImages.append(imageView)
            }
        case .defense:
            for character in game.defenseCharacters {
                let imageView = UIImageView()
                imageView.image = character.profileImage
                characterImages.append(imageView)
            }
        case .tank:
            for character in game.tankCharacters {
                let imageView = UIImageView()
                imageView.image = character.profileImage
                characterImages.append(imageView)
            }
        case .support:
            for character in game.supportCharacters {
                let imageView = UIImageView()
                imageView.image = character.profileImage
                characterImages.append(imageView)
            }
        }
        
        
        for view in characterImageStack.arrangedSubviews {
            characterImageStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        
        for image in characterImages {
            self.view.addSubview(image)
            image.translatesAutoresizingMaskIntoConstraints = false
            image.widthAnchor.constraint(equalTo: characterScroll.widthAnchor).isActive = true
            characterImageStack.addArrangedSubview(image)
        }
        
        characterImageStack.widthAnchor.constraint(equalTo: characterScroll.widthAnchor, multiplier: CGFloat(characterImages.count)).isActive = true
    }
    
    @IBAction func heroTypeSelector(_ sender: AnyObject) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            game.heroType = .offense
        case 1:
            game.heroType = .defense
        case 2:
            game.heroType = .tank
        case 3:
            game.heroType = .support
        default:
            print("error")
        }
        
        updateViews()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat = scrollView.bounds.size.width / CGFloat(characterImages.count)
        let currentPage = Int(scrollView.contentOffset.x / pageWidth)
        print(currentPage)
        
        switch game.heroType {
        case .offense:
            characterNameLabel.text = game.offenseCharacters[currentPage/6].name.description
        case .defense:
            characterNameLabel.text = game.defenseCharacters[currentPage/6].name.description
        case .tank:
            characterNameLabel.text = game.tankCharacters[currentPage/5].name.description
        case .support:
            characterNameLabel.text = game.supportCharacters[currentPage/5].name.description
        }

    }
}








