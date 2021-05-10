//
// Copyright (c) 2021 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Adyen
import AdyenActions
import Foundation

internal struct PaymentsRequest: Request {
    
    internal typealias ResponseType = PaymentsResponse
    
    internal let path = "payments"
    
    internal let data: PaymentComponentData
    
    internal var counter: UInt = 0
    
    internal var method: HTTPMethod = .post
    
    internal var queryParameters: [URLQueryItem] = []
    
    internal var headers: [String: String] = [:]
    
    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        let currentConfiguration = ConfigurationConstants.current
        
        try container.encode(data.paymentMethod.encodable, forKey: .details)
        try container.encode(data.storePaymentMethod, forKey: .storePaymentMethod)
        try container.encode(data.shopperName, forKey: .shopperName)
        try container.encode(data.emailAddress ?? ConfigurationConstants.shopperEmail, forKey: .shopperEmail)
        try container.encode(data.telephoneNumber, forKey: .telephoneNumber)
        try container.encode(data.billingAddress, forKey: .billingAddress)
        try container.encode(Locale.current.identifier, forKey: .shopperLocale)
        try container.encodeIfPresent(data.browserInfo, forKey: .browserInfo)
        try container.encode("iOS", forKey: .channel)
        try container.encode(currentConfiguration.amount, forKey: .amount)
        try container.encode(ConfigurationConstants.reference, forKey: .reference)
        try container.encode(currentConfiguration.countryCode, forKey: .countryCode)
        try container.encode(ConfigurationConstants.returnUrl, forKey: .returnUrl)
        try container.encode(ConfigurationConstants.shopperReference, forKey: .shopperReference)
        try container.encode(ConfigurationConstants.additionalData, forKey: .additionalData)
        try container.encode(currentConfiguration.merchantAccount, forKey: .merchantAccount)
    }
    
    private enum CodingKeys: String, CodingKey {
        case details = "paymentMethod"
        case storePaymentMethod
        case amount
        case reference
        case channel
        case countryCode
        case returnUrl
        case shopperReference
        case shopperEmail
        case additionalData
        case merchantAccount
        case browserInfo
        case shopperName
        case telephoneNumber
        case shopperLocale
        case billingAddress
    }
    
}

internal struct PaymentsResponse: Response {
    
    internal let resultCode: ResultCode
    
    internal let action: Action?
    
    internal init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resultCode = try container.decode(ResultCode.self, forKey: .resultCode)
        self.action = try container.decodeIfPresent(Action.self, forKey: .action)
    }
    
    private enum CodingKeys: String, CodingKey {
        case resultCode
        case action
    }
    
}

internal extension PaymentsResponse {
    
    // swiftlint:disable:next explicit_acl
    enum ResultCode: String, Decodable {
        case authorised = "Authorised"
        case refused = "Refused"
        case pending = "Pending"
        case cancelled = "Cancelled"
        case error = "Error"
        case received = "Received"
        case redirectShopper = "RedirectShopper"
        case identifyShopper = "IdentifyShopper"
        case challengeShopper = "ChallengeShopper"
        case presentToShopper = "PresentToShopper"
    }
    
}