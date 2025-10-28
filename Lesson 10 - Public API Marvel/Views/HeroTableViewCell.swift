//
//  HeroTableViewCell.swift
//  Lesson 10 - Public API Marvel
//
//  Created by Феликс on 25.10.2025.
//

import UIKit
import SDWebImage

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var heroPhotoImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroDescriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with hero: MarvelCharacter) {
        heroPhotoImageView.sd_setImage(with: hero.thumbnail.thumbnailURL)
        heroNameLabel.text = hero.name
        heroDescriptionLabel.text = hero.description
    }
}
