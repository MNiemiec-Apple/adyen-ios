//
// Copyright (c) 2021 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Adyen
import Foundation

/// :nodoc:
internal final class WeChatPayAdditionalDetails: AdditionalDetails {
    
    /// :nodoc:
    internal let resultCode: String
    
    /// :nodoc:
    internal init(resultCode: String) {
        self.resultCode = resultCode
    }
    
}
