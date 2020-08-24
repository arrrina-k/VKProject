//
//  NewGroup.swift
//  VK
//
//  Created by Арина Кривенко on 24.08.2020.
//  Copyright © 2020 Арина Кривенко. All rights reserved.
//

import Foundation

struct NewGroup {
    var newGroupName: String
    var newGroupImage: String
    
   static var newGroupsName = ["Ну погоди", "СпанчБоб", "Зверополис", "Шрек", "Король Лев", "Свинка Пеппа"]
    
    static func getNewGroups() -> [NewGroup]{
        
        var newGroups = [NewGroup]()
        
        for newGroup in newGroupsName{
            newGroups.append(NewGroup(newGroupName: newGroup, newGroupImage: newGroup))
        }
        return newGroups
    }
}
