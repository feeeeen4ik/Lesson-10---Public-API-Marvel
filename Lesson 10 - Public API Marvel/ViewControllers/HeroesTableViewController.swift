//
//  HeroesTableViewController.swift
//  Lesson 10 - Public API Marvel
//
//  Created by Феликс on 25.10.2025.
//

import UIKit
import SVProgressHUD

class HeroesTableViewController: UITableViewController, UISearchBarDelegate {
    
    private var marvelHeroes = [MarvelCharacter]()
    private var networkManager = Networking.shared
    private var searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackground()
        prepareSearchController()
        fetchHeroes()
    }
    
    private func fetchHeroes(
        nameStartsWith: String? = nil,
        characterId: Int? = nil
    ) {
        SVProgressHUD.show()
        networkManager
            .fetchAllCharacters(
                nameStartsWith: nameStartsWith,
                characterID: characterId
            ) { result in
                SVProgressHUD.dismiss()
            switch result {
            case .success(let marvelCharacters):
                if marvelCharacters.count == 0 {
                    self.showAlert(
                        title: "Ошибка!",
                        message: "Поиск не дал результатов"
                    )
                    self.fetchHeroes()
                    return
                }
                self.marvelHeroes = marvelCharacters
                self.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
                self.showAlert(
                    title: "Ошибка!",
                    message: error.localizedDescription
                )
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        marvelHeroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        guard let cell = cell as? HeroTableViewCell else {
            return UITableViewCell()
        }
        
        cell.backgroundColor = UIColor.white.withAlphaComponent(0.4)
        cell.contentView.backgroundColor = .clear
        cell.selectionStyle = .none
        
        cell.configure(with: marvelHeroes[indexPath.row])
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "heroDescription") as! HeroeDescriptionViewController
        
        vc.heroId = marvelHeroes[indexPath.row].id
        vc.title = marvelHeroes[indexPath.row].name
        
        navigationController?.show(vc, sender: self)
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text, !searchText.isEmpty {
            marvelHeroes.removeAll()
            tableView.reloadData()
            fetchHeroes(nameStartsWith: searchText)
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    private func setBackground() {
        let backgroundImageView = UIImageView(frame: tableView.bounds)
        backgroundImageView.image = UIImage(named: "MarvelBackground")
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        
        let containerView = UIView(frame: tableView.bounds)
        containerView.addSubview(backgroundImageView)
        
        let dimView = UIView(frame: tableView.bounds)
        dimView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        containerView.addSubview(dimView)

        tableView.backgroundView = containerView
        tableView.backgroundColor = .clear
    }
    
    private func prepareSearchController() {
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Marvel Hero"
        navigationItem.searchController = searchController
    }
}
