//
//  Race.swift
//  WOWAnthology
//
//  Created by Caitlyn Daly on 12/14/18.
//  Copyright © 2018 Caitlyn Daly. All rights reserved.
//

import Foundation

class Race: NSObject{
    var id = 0
    var name = ""
    var generNames : [String] = []
    var faction : [String] = []
    
    init(id: Int, name: String, genderNames: [String], faction: [String] ){
        self.id = id
        self.name = name
        self.generNames = genderNames
        self.faction = faction
    }
    
    func getID()->Int{
        return self.id
    }
    
    func getName()->String{
        return self.name
    }
    
    func getGenerNames()->[String]{
        return self.generNames
    }
    
    func getFaction()->[String]{
        return self.faction
    }
    
    
}
