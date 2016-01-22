//
//  PaymentMethodSearchItem.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 15/1/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

public class PaymentMethodSearchItem {
    
    public var idPaymentMethodSearchItem : String!
    public var type : PaymentMethodSearchItemType!
    public var description : String!
    public var comment : String?
    public var iconName : String!
    public var childrenHeader : String?
    public var active : Bool!
    public var children : [PaymentMethodSearchItem] = []
    
    public class func fromJSON(json : NSDictionary) -> PaymentMethodSearchItem {
        let pmSearchItem = PaymentMethodSearchItem()
        
        if json["id"] != nil && !(json["id"]! is NSNull) {
            pmSearchItem.idPaymentMethodSearchItem = JSON(json["id"]!).asString
        }
        
        if json["active"] != nil && !(json["active"]! is NSNull) {
            pmSearchItem.active = JSON(json["active"]!).asBool
        }

        
        if json["type"] != nil && !(json["type"]! is NSNull) {
            pmSearchItem.type = PaymentMethodSearchItemType(rawValue: JSON(json["type"]!).asString!)
        }
        
        if json["icon_name"] != nil && !(json["icon_name"]! is NSNull) {
            pmSearchItem.iconName = JSON(json["icon_name"]!).asString!
        }
        
        if json["description"] != nil && !(json["description"]! is NSNull) {
            pmSearchItem.description = JSON(json["description"]!).asString!
        }
        
        if json["comment"] != nil && !(json["comment"]! is NSNull) {
            pmSearchItem.comment = JSON(json["comment"]!).asString!
        }
        
        if json["children_header"] != nil && !(json["children_header"]! is NSNull) {
            pmSearchItem.childrenHeader = JSON(json["children_header"]!).asString!
        }
        
        var children = [PaymentMethodSearchItem]()
        if let childrenJson = json["children"] as? NSArray {
            for i in 0..<childrenJson.count {
                if let childJson = childrenJson[i] as? NSDictionary {
                    children.append(PaymentMethodSearchItem.fromJSON(childJson))
                }
            }
            pmSearchItem.children = children
        }
        
        return pmSearchItem
    }
    
}

public enum PaymentMethodSearchItemType : String {
    case GROUP = "group"
    case PAYMENT_TYPE = "payment_type"
    case PAYMENT_METHOD = "payment_method"
}
