//
//  Boss.swift
//  WOWAnthology
//
//  Created by Caitlyn Daly on 12/15/18.
//  Copyright © 2018 Caitlyn Daly. All rights reserved.
//

import Foundation
class Boss: NSObject{
    var name = ""
    var desc = ""
    var zoneid = 0
    var availableNormal = false
    var availableHeroic = false
    var healthNormal = 0
    var healthHeroic = 0
    var levelNormal = 0
    var heroicLevel = 0
    
    init(name: String, description: String, zoneid: Int, availableNormal: Bool, availableHeroic:Bool, healthNormal:Int, healthHeroic:Int, levelNormal: Int, heroicLevel: Int){
        self.name = name
        self.desc = description
        self.zoneid = zoneid
        self.availableNormal = availableNormal
        self.availableHeroic = availableHeroic
        self.healthNormal = healthNormal
        self.healthHeroic = healthHeroic
        self.levelNormal = levelNormal
        self.heroicLevel = heroicLevel
    }
    
    func getName()->String{
        return self.name
    }
    
    func getDesc()->String{
        return self.desc
    }
    
    func getZoneid()->Int{
        return self.zoneid
    }
    
    func getAvailNormal()->Bool{
        return self.availableNormal
    }
    
    func getAvailHeroic()->Bool{
        return self.availableHeroic
    }
    
    func getNormalHealth()->Int{
        return self.healthNormal
    }
    
    func getHeroicHealth()->Int{
        return self.healthHeroic
    }
    func getNormalLevel()->Int{
        return self.levelNormal
    }
    func getHeroicLevel()->Int{
        return self.heroicLevel
    }
}
