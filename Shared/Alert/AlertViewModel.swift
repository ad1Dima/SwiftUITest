//
//  AlertViewModel.swift
//  SwiftUISettings
//
//  Created by Dmitrii Adodin on 01.04.2022.
//

import Foundation
import Dispatch

protocol AlertPresenter {
    func showMessage(_ message: String, complition: @escaping () -> Void)
}

class AlertViewModel: ObservableObject, AlertPresenter {
    @Published var showingAlert = false
    @Published var alertTitle = ""

    private var complition: (() -> Void)?

    func showMessage(_ message: String, complition: @escaping () -> Void) {
        alertTitle = message
        showingAlert = true

        self.complition = complition
    }

    func buttonPressed(buttonId: Int) {
        complition?()
    }
}
