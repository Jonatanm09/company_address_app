//
//  Session.swift
//  companyApp
//
//  Created by Jonatan Wepsys on 4/7/21.
//

class Session {
    static let  shared: Session = Session()
    private init(){}
    
    var client = [Client]()
}
