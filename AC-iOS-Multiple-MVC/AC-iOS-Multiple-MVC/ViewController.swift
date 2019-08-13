//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var animals = ZooAnimal.zooAnimals
    
    @IBOutlet weak var tableViewOut: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableViewOut.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? AnimalTVC {
            cell.imageOut.image = UIImage(named: "\(animals[indexPath.row].imageNumber)")
            cell.labelName.text = animals[indexPath.row].name
            cell.originLabel.text = animals[indexPath.row].origin
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
    
    
    
    override func viewDidLoad() {
        tableViewOut.delegate = self
        tableViewOut.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let segueIdentifier = segue.identifier else { fatalError("No identifier in segue")
        }
        switch segueIdentifier {
        case "detailSegue":
            guard let animalVC = segue.destination as? DetailViewController
                else { fatalError("Unexpected segue")}
            guard let selectedIndexPath = tableViewOut.indexPathForSelectedRow else {
                fatalError("No row selected")
            }
            animalVC.selected = animals[selectedIndexPath.row]
        default:
            fatalError("Unexpected segue identifier")
        }
    }


}

