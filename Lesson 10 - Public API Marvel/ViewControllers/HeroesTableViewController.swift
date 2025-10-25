//
//  HeroesTableViewController.swift
//  Lesson 10 - Public API Marvel
//
//  Created by Феликс on 25.10.2025.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    
    private var marvelHeroes = [MarevelCharacter]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        marvelHeroes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }
    

}
