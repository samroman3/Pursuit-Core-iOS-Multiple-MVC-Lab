//
//  DetailViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Sam Roman on 8/13/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var selected: ZooAnimal!
    
    @IBOutlet weak var imageOut: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var originLabel: UILabel!
    
    
    override func viewDidLoad() {
    nameLabel.text = selected.name
    infoLabel.text = selected.info
    imageOut.image = UIImage(named: String(selected.imageNumber))
    originLabel.text = selected.origin
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
