//
// Copyright (c) 2020 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Adyen
import Foundation

internal struct PaymentMethodsRequest: Request {
    internal typealias ResponseType = PaymentMethodsResponse

    internal let path = "paymentMethods"

    internal var counter: UInt = 0

    internal var method: HTTPMethod = .post

    internal var headers: [String: String] = [:]

    internal var queryParameters: [URLQueryItem] = []

    // MARK: - Encoding

    internal func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(Configuration.countryCode, forKey: .countryCode)
        try container.encode(Configuration.shopperReference, forKey: .shopperReference)
        try container.encode(Configuration.merchantAccount, forKey: .merchantAccount)
    }

    internal enum CodingKeys: CodingKey {
        case countryCode
        case shopperReference
        case merchantAccount
    }
}

internal struct PaymentMethodsResponse: Response {
    internal let paymentMethods: PaymentMethods

    internal init(from decoder: Decoder) throws {
        paymentMethods = try PaymentMethods(from: decoder)
    }
}
