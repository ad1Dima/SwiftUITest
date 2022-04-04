//
//  AlertView.swift
//  SwiftUISettings
//
//  Created by Dmitrii Adodin on 01.04.2022.
//

import Foundation

import SwiftUI

struct AlertView: View {
    @ObservedObject var alertViewModel: AlertViewModel

    var body: some View {
        Text("")
            .alert(
                alertViewModel.alertTitle,
                isPresented: $alertViewModel.showingAlert) {
                    Button("OK") {
                        alertViewModel.messageShowingComplete()
                    }
                }
    }
}
