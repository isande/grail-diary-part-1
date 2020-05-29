//
//  POIDetailViewController.swift
//  GrailDiary
//
//  Created by Peggy Wollenhaupt on 5/28/20.
//  Copyright © 2020 Peggy Wollenhaupt. All rights reserved.
//

import UIKit

class POIDetailViewController: UIViewController {

    var poi: POI?
    
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cluesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

        // Do any additional setup after loading the view.
    }
    
    private func updateViews() {
        guard let poi = poi else { return }
        locationLabel.text = poi.location
        countryLabel.text = poi.country
        cluesTextView.text = poi.clues.joined(separator: "\n")
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
