//
//  PaymentMethodsSearch.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 15/1/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//
import Foundation

public class PaymentMethodSearch: Equatable {
    
    var groups : [PaymentMethodSearchItem]!
    var preferred : [PaymentMethodSearchItem]!
    var defaultPayment : PaymentMethodSearchItem!
    

    public class func fromJSON(json : NSDictionary) -> PaymentMethodSearch {
        let pmSearch = PaymentMethodSearch()
        
        var groups = [PaymentMethodSearchItem]()
        if let groupsJson = json["groups"] as? NSArray {
            for i in 0..<groupsJson.count {
                if let groupDic = groupsJson[i] as? NSDictionary {
                    groups.append(PaymentMethodSearchItem.fromJSON(groupDic))
                }
            }
            pmSearch.groups = groups
        }
        
        var preferred = [PaymentMethodSearchItem]()
        if let preferredJson = json["preferred"] as? NSArray {
            for i in 0..<preferredJson.count {
                if let preferredDic = preferredJson[i] as? NSDictionary {
                    preferred.append(PaymentMethodSearchItem.fromJSON(preferredDic))
                }
            }
            pmSearch.preferred = preferred
        }
        
        if json["default"] != nil {
            pmSearch.defaultPayment = PaymentMethodSearchItem.fromJSON(json["default"] as! NSDictionary)
        }
        return pmSearch
    }
    
}

public func ==(obj1: PaymentMethodSearch, obj2: PaymentMethodSearch) -> Bool {
    let areEqual =
    obj1.groups == obj2.groups &&
    obj1.preferred == obj2.preferred &&
    obj1.defaultPayment == obj2.defaultPayment
    
    return areEqual
}