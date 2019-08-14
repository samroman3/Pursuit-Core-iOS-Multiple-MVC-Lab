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
    
    var amphibians = ZooAnimal.zooAnimals.filter{ $0.classification == "Amphibian"}
    var reptiles = ZooAnimal.zooAnimals.filter{ $0.classification == "Reptile"}
    var mammals = ZooAnimal.zooAnimals.filter{ $0.classification == "Mammal"}
    var birds = ZooAnimal.zooAnimals.filter{ $0.classification == "Bird"}
    var insects = ZooAnimal.zooAnimals.filter{ $0.classification == "Insect"}
    
    @IBOutlet weak var tableViewOut: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return amphibians.count
        case 1:
            return reptiles.count
        case 2:
            return mammals.count
        case 3:
            return birds.count
        case 4:
            return insects.count
        default:
            return 2
        }
    }
    
   
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableViewOut.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? AnimalTVC {
            cell.imageOut.image = UIImage(named: "\(amphibians[indexPath.row].imageNumber)")
            cell.labelName.text = amphibians[indexPath.row].name
            cell.originLabel.text = amphibians[indexPath.row].origin
            return cell
            }
        case 1:
            if let cell = tableViewOut.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? AnimalTVC {
            cell.imageOut.image = UIImage(named: "\(reptiles[indexPath.row].imageNumber)")
            cell.labelName.text = reptiles[indexPath.row].name
            cell.originLabel.text = reptiles[indexPath.row].origin
            return cell
            }
        case 2:
            if let cell = tableViewOut.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? AnimalTVC {
                cell.imageOut.image = UIImage(named: "\(mammals[indexPath.row].imageNumber)")
                cell.labelName.text = mammals[indexPath.row].name
                cell.originLabel.text = mammals[indexPath.row].origin
            return cell
            }
        case 3:
            if let cell = tableViewOut.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? AnimalTVC {
            cell.imageOut.image = UIImage(named: "\(birds[indexPath.row].imageNumber)")
            cell.labelName.text = birds[indexPath.row].name
            cell.originLabel.text = birds[indexPath.row].origin
            return cell
            }
        case 4:
            if let cell = tableViewOut.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? AnimalTVC {
            cell.imageOut.image = UIImage(named: "\(insects[indexPath.row].imageNumber)")
            cell.labelName.text = insects[indexPath.row].name
            cell.originLabel.text = insects[indexPath.row].origin
            return cell
            }
        default: return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Amphibians"
        case 1:
            return "Reptiles"
        case 2:
            return "Mammals"
        case 3:
            return "Birds"
        case 4:
            return "Insects"
        default:
            return "never"
            
        }
        
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
            switch selectedIndexPath.section{
            case 0:
                animalVC.selected = amphibians[selectedIndexPath.row]
            case 1:
                animalVC.selected = reptiles[selectedIndexPath.row]
            case 2:
                animalVC.selected = mammals[selectedIndexPath.row]
            case 3:
                animalVC.selected = birds[selectedIndexPath.row]
            case 4:
                animalVC.selected = insects[selectedIndexPath.row]
            default:
               break
            }
        default:
            fatalError("Unexpected segue identifier")
        }
    }

//    func populate(cell: UITableViewCell,animalType: [ZooAnimal], indexPath: IndexPath ) -> UITableViewCell {
//        if let cell = tableViewOut.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) as? AnimalTVC {
//            cell.imageOut.image = UIImage(named: "\(animalType[indexPath.row].imageNumber)")
//            cell.labelName.text = animalType[indexPath.row].name
//            cell.originLabel.text = animalType[indexPath.row].origin
//            return cell
//    }
//
//}
    
}


