//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Andrea on 29/05/2019.
//  Copyright © 2019 Andrea. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategories()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        cell.textLabel?.text = categories[indexPath.row].name
        return cell
    }
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving categories: \(error)")
        }
    }
    
    func loadCategories() {
        let request : NSFetchRequest<Category> = Category.fetchRequest()
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error loading categories: \(error)")
        }
        tableView.reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        var textField = UITextField()
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            self.saveCategories()
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(action)
        alert.addAction(cancel)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
    }
}
