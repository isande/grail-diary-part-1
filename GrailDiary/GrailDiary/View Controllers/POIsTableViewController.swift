//
//  ViewController.swift
//  GrailDiary
//
//  Created by Peggy Wollenhaupt on 5/22/20.
//  Copyright © 2020 Peggy Wollenhaupt. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

    var pois: [POI] = [POI(location: "Utah", country: "USA", clues: ["strange marking", "discarded spring", "old pot"])]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
    }
}

extension POIsTableViewController: UITableViewDelegate {
    
}

extension POIsTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pois.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }
        
        let poi = pois[indexPath.row]
        
        cell.locationLabel.text = pois[indexPath.row].location
        cell.countryLabel.text = pois[indexPath.row].country
        cell.cluesCountLabel.text = "\(pois[indexPath.row].clues.count)"
        
        return cell
    }
    
    
    
}

