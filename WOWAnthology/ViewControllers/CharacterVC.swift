//
//  FirstViewController.swift
//  WOWAnthology
//
//  Created by Caitlyn Daly on 12/13/18.
//  Copyright © 2018 Caitlyn Daly. All rights reserved.
//

import UIKit

class CharacterVC: UITableViewController {

    
    @IBOutlet var characterView:UITableView!
    var change = 0;
    var RACES = 0
    var CLASSES = 1
    var ACHIEVEMENTS = 2
    
    var raceList = Races()
    var races: Races{
        get{
            return self.raceList
        }
    }
    /**
     * action listener
     */
    
    @IBAction func toggleInfo(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case ACHIEVEMENTS:
            change = ACHIEVEMENTS
        case CLASSES:
            change = CLASSES
        default:
            change = RACES
        }
        characterView.reloadData()
    }
    
    
    /**
    * All the table view stuff
    */
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return raceList.racesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "raceList", for: indexPath)
        let race = raceList.racesList
        cell.nameText.text = race[indexPath.row].getName()
        cell.raceImage.image = 
        //cell.textLabel?.text = race[indexPath.row].ge
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

