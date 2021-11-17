//
// Copyright (c) 2021 Adyen N.V.
//
// This file is open source and available under the MIT license. See the LICENSE file for more info.
//

import Adyen
import Foundation

internal protocol BACSDirectDebitInputFormViewProtocol {
    func append(item: FormItem)
}

internal class BACSDirectDebitInputFormView: FormViewController, BACSDirectDebitInputFormViewProtocol {

    // MARK: - Properties

    internal weak var presenter: BACSDirectDebitPresenterProtocol?

    // MARK: - Intializers

    internal init(title: String,
                  styleProvider: FormComponentStyle) {
        super.init(style: styleProvider)
        self.title = title
        self.delegate = self
    }

    // MARK: - BACSDirectDebitInputFormViewProtocol

    internal func append(item: FormItem) {
        append(item: item)
    }
}

extension BACSDirectDebitInputFormView: ViewControllerDelegate {
    func viewDidLoad(viewController: UIViewController) {
        // TODO: - Complete logic
        presenter?.viewDidLoad()
    }

    func viewDidAppear(viewController: UIViewController) {
        // TODO: - Complete logic
    }

    func viewWillAppear(viewController: UIViewController) {
        // TODO: - Complete logic
    }
}