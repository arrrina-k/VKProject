//
//  Group.swift
//  VK
//
//  Created by Арина Кривенко on 23.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import Foundation

struct Group: Equatable {
    var groupName: String
    var groupImage: String
    
    static var groupsName = ["Корпорация монстров", "Алеша Попович", "Дом"]
    static var myGroupsName = ["Шрек"]
    
    static func getGroups() -> [Group]{
        
        var groups = [Group]()
        
        for group in groupsName{
            groups.append(Group(groupName: group, groupImage: group))
        }
        
        return groups
    }
    
    static func getMyGroups() -> [Group]{
        
        var myGroups = [Group]()
        
        for myGroup in myGroupsName{
            myGroups.append(Group(groupName: myGroup, groupImage: myGroup))
        }
        return myGroups
    }
}
