//
//  ViewController.swift
//  WeatherApp
//
//  Created by Mac on 18.03.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    var recipes: [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        fetchRecipes()
    }
    
    func fetchRecipes() {
        let fetchRequest = Recipe.fetchRequest() as! NSFetchRequest<Recipe>
        let asyncFetchRequest = NSAsynchronousFetchRequest(fetchRequest: fetchRequest) { result in
            let fetchRequest = NSFetchRequest<Recipe>(entityName: NSStringFromClass(Recipe.self))
            let fetchRequest = NSFetchRequest<Recipe>(entityName: String(describing: Recipe.self))
            let fetchRequest: NSFetchRequest<Recipe> = Recipe.fetchRequest()
            do {
                recipes = try AppDelegate.shared.persistentContainer.viewContext.fetch(fetchRequest)
                tableView.reloadData()
            } catch {
                print("Error fetching recipes: \(error.localizedDescription)")
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell", for: indexPath) as! RecipeTableViewCell
        let recipe = recipes[indexPath.row]
        cell.titleLabel.text = recipe.name
        cell.ingredientsLabel.text = recipe.ingredients
        cell.recipeImageView.image = UIImage(named: recipe.imageUrl)
        return cell
    }
    
}

