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
    @Published var showingAlert = false {
        didSet {
            guard showingAlert == false else {
                return
            }

            messageShowingComplete()
        }
    }
    @Published var alertTitle = ""

    var semaphore: DispatchSemaphore?

    func showMessage(_ message: String, complition: @escaping () -> Void) {
        alertTitle = message
        showingAlert = true

        let semaphore = DispatchSemaphore(value: 0)
        self.semaphore = semaphore

        Task {
            await withCheckedContinuation { (continuation: CheckedContinuation<Void, Never>)  in
                semaphore.wait()
                continuation.resume()
            }
            DispatchQueue.main.async {
                complition()
            }
        }
    }

    func messageShowingComplete() {
        semaphore?.signal()
        semaphore = nil
    }
}
