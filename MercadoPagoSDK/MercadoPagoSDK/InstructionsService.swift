//
//  InstructionsService.swift
//  MercadoPagoSDK
//
//  Created by Maria cristina rodriguez on 16/2/16.
//  Copyright © 2016 MercadoPago. All rights reserved.
//

import UIKit

public class InstructionsService: MercadoPagoService {

    public let MP_INSTRUCTIONS_URL = "https://api.mercadopago.com"
    public let MP_INSTRUCTIONS_URI = "/checkout/beta/v1/instructions"
    
    public init(){
        super.init(baseURL: MP_INSTRUCTIONS_URL)
    }
    
    public func getInstructionsForPaymentId(paymentId : Int, paymentMethodId: String, success : (instruction :Instruction) -> Void, failure: ((error: NSError) -> Void)?){
    
        let params =  "public_key=" + MercadoPagoContext.publicKey() + "&payment_method_id=" + paymentMethodId
        self.request(MP_INSTRUCTIONS_URI + "/" + String(paymentId), params: params, body: nil, method: "GET", success: { (jsonResult) -> Void in
            success(instruction : Instruction.fromJSON(jsonResult as! NSDictionary))
        }, failure: failure)
    }
}
