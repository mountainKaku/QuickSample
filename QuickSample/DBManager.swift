//
//  DBManager.swift
//  QuickSample
//
//  Created by akatsuki174 on 2016/02/23.
//  Copyright © 2016年 akatsuki174. All rights reserved.
//

import RealmSwift

class DBManager {
    func findAll() -> Results<RealmGoods>? {
        let realm = try! Realm()
        return realm.objects(RealmGoods.self).sorted(byKeyPath: "id")
    }
    
    func update(_ goods: RealmGoods) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(goods, update: true)
        }
    }
    
    func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
    }
}
