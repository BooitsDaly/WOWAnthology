//
//  AppDelegate.swift
//  WOWAnthology
//
//  Created by Caitlyn Daly on 12/13/18.
//  Copyright © 2018 Caitlyn Daly. All rights reserved.
//

import UIKit
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var races : [Race] = []
    var bosses : [Boss] = []
    var tabBarController:UITabBarController?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        getRaces()
        
        tabBarController = window?.rootViewController as? UITabBarController
        let navBar = tabBarController?.viewControllers![1] as! UINavigationController
        let characterVC = navBar.viewControllers.first as! CharacterVC
        //_ = tabBarController?.viewControllers![1] as! UITabBarController
        let raceList = Races()
        characterVC.raceList = raceList
        // Override point for customization after application launch.
        return true
    }
    func getRaces(){
        let racesJSON = getDataFromAPI(url: "https://us.api.blizzard.com/data/wow/race/index?namespace=static-us&locale=en_US&access_token=USMvOtydef4NMmy6ijoBb3E6IoSAxsAPrR")["races"]
        //now call each api for each race information
        for (_,subJson):(String, JSON) in racesJSON {
            let idURL = subJson[0]["key"]["href"].stringValue
            let raceJSON = getDataFromAPI(url: idURL)
            //get all the values make a Race class
            let raceid = raceJSON["id"].intValue
            let name = raceJSON["name"].stringValue
            let genders = raceJSON["gener_name"]
            var genderNames: [String] = []
            for(_,genderSubJSON):(String,JSON) in genders{
                genderNames[0] = genderSubJSON["male_name"].stringValue
                genderNames[1] = genderSubJSON["female_name"].stringValue
            }
            let factionJSON = raceJSON["faction"]
            var allFactions : [String] = []
            for (index,factionSubJSON):(String, JSON) in factionJSON {
                // Do something you want
                allFactions[index.count] = factionSubJSON["name"].stringValue
            }
            //place race class into Races
            let race = Race(id: raceid, name: name, genderNames: genderNames, faction: allFactions)
            races.append(race)
        }
    }
    
    func getBoss(){
        let bossJSON = getDataFromAPI(url: "https://us.api.blizzard.com/wow/boss/?locale=en_US&access_token=USjuADnycx3uz6Yg2zN7tfDHMhJLItT0IZ")
        for(_,subJson):(String,JSON) in bossJSON{
            let name = subJson["name"].stringValue
            let description = subJson["description"].stringValue
            //should i display zone information?
            let zoneid = subJson["zondId"].intValue
            let availableNormal = subJson["availableInNormalMode"].boolValue
            let availableHeroic = subJson["availableInHeroicMode"].boolValue
            let healthNormal = subJson["health"].intValue
            let healthHeroic = subJson["heroicHealth"].intValue
            let levelNormal = subJson["health"].intValue
            let heroicLevel = subJson["heroicLeve"].intValue
            
            let boss = Boss(name: name, description: description, zoneid: zoneid, availableNormal: availableNormal, availableHeroic:availableHeroic, healthNormal:healthNormal, healthHeroic:healthHeroic, levelNormal: levelNormal, heroicLevel: heroicLevel)
            bosses.append(boss)
            
        }
    }
    
    func getDataFromAPI(url:String)->JSON{
        let endpoint = URL(string: url)
        let data = try? Data(contentsOf: endpoint!)
        return JSON(data!)
    }
    
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

