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
       
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddPOIModalSegue" {
            
            let newPOIVC = segue.destination as? AddPOIViewController
            
            newPOIVC?.delegate = self
            
        } else if segue.identifier == "ShowPOIDetailSegue" {
            
            if let detailVC = segue.destination as? POIDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                let poi = pois[indexPath.row]
                detailVC.poi = poi
            }
        }
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
                
        cell.locationLabel.text = pois[indexPath.row].location
        cell.countryLabel.text = pois[indexPath.row].country
        cell.cluesCountLabel.text = "\(pois[indexPath.row].clues.count) clues"
        
        return cell
    }
    
}

extension POIsTableViewController: AddPOIDelegate {
    
    func poiWasAdded(_ poi: POI) {
        pois.append(poi)
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
}
