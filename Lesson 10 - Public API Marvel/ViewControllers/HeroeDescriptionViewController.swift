//
//  ViewController.swift
//  Lesson 10 - Public API Marvel
//
//  Created by Феликс on 25.10.2025.
//

import UIKit
import SVProgressHUD
import SDWebImage

class HeroeDescriptionViewController: UIViewController {
    
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroDescriptionTextView: UITextView!
    @IBOutlet weak var comicsCountLabel: UILabel!
    @IBOutlet weak var storiesCountLabel: UILabel!
    @IBOutlet weak var eventsCountLabel: UILabel!
    @IBOutlet weak var seriesCountLabel: UILabel!
    
    private var networkManager = Networking.shared
    private var hero: MarvelCharacter!
    var heroId: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIElements(hidden: true)
        fetchHero(characterId: heroId)
    }

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    private func fetchHero(
        characterId: Int? = nil
    ) {
        SVProgressHUD.show()
        networkManager
            .fetchAllCharacters(
                characterID: characterId
            ) { result in
                SVProgressHUD.dismiss()
            switch result {
            case .success(let marvelCharacters):
                if marvelCharacters.count == 0 {
                    self.showAlert(
                        title: "Ошибка!",
                        message: "Герой с данным ID не найден"
                    )
                    return
                }
                
                self.hero = marvelCharacters[0]
                self.updateHero()
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(
                    title: "Ошибка!",
                    message: error.localizedDescription
                )
            }
        }
    }

    private func updateHero() {
        
        guard let hero = hero else { return }
        
        heroImageView.sd_setImage(with: hero.thumbnail.thumbnailURL)
        if hero.description != "" {
            heroDescriptionTextView.text = hero.description
            heroDescriptionTextView.backgroundColor? = UIColor.white.withAlphaComponent(0.4)
        } else {
            heroDescriptionTextView.text = ""
            heroDescriptionTextView.isHidden = true
        }
        comicsCountLabel.text = "Комиксы: \(hero.comics.items.count)"
        comicsCountLabel.backgroundColor? = UIColor.white.withAlphaComponent(0.4)
        
        storiesCountLabel.text = "Историй: \(hero.stories.items.count)"
        storiesCountLabel.backgroundColor? = UIColor.white.withAlphaComponent(0.4)
        
        eventsCountLabel.text = "Событий: \(hero.events.items.count)"
        eventsCountLabel.backgroundColor? = UIColor.white.withAlphaComponent(0.4)
        
        seriesCountLabel.text = "Серий: \(hero.series.items.count)"
        seriesCountLabel.backgroundColor? = UIColor.white.withAlphaComponent(0.4)
        
        UIElements(hidden: false)
    }
    
    private func UIElements(hidden: Bool) {
        heroImageView.isHidden = hidden
        if heroDescriptionTextView.text != "" {
            heroDescriptionTextView.isHidden = hidden
        } else {
            heroDescriptionTextView.isHidden = true
        }
        comicsCountLabel.isHidden = hidden
        storiesCountLabel.isHidden = hidden
        eventsCountLabel.isHidden = hidden
        seriesCountLabel.isHidden = hidden
    }
}

