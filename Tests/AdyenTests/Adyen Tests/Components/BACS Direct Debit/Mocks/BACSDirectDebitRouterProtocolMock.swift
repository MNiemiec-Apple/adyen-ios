//
//  BACSDirectDebitRouterProtocolMock.swift
//  AdyenUIKitTests
//
//  Created by Naufal Aros on 12/2/21.
//  Copyright © 2021 Adyen. All rights reserved.
//

@testable import Adyen
@testable import AdyenComponents
import Foundation

class BACSDirectDebitRouterProtocolMock: BACSDirectDebitRouterProtocol {

    // MARK: - presentConfirmationWithData

    var presentConfirmationWithDataCallsCount = 0
    var presentConfirmationWithDataCalled: Bool {
        return presentConfirmationWithDataCallsCount > 0
    }

    func presentConfirmation(with data: BACSDirectDebitData) {
        presentConfirmationWithDataCallsCount += 1
    }

    // MARK: - confirmPaymentWithData

    var confirmPaymentWithDataCallsCount = 0
    var confirmPaymentWithDataCalled: Bool {
        return confirmPaymentWithDataCallsCount > 0
    }

    func confirmPayment(with data: BACSDirectDebitData) {
        confirmPaymentWithDataCallsCount += 1
    }

    // MARK: - cancelPayment

    var cancelPaymentCallsCount = 0
    var cancelPaymentCalled: Bool {
        return cancelPaymentCallsCount > 0
    }

    func cancelPayment() {
        cancelPaymentCallsCount += 1
    }
}