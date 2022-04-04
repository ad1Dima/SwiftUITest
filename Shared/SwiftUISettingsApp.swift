//
//  SwiftUISettingsApp.swift
//  Shared
//
//  Created by Dmitrii Adodin on 01.04.2022.
//

import SwiftUI

@main
struct SwiftUISettingsApp: App {

    @State var alertViewModel: AlertViewModel = AlertViewModel()

    var body: some Scene {
        WindowGroup {
            SettingsView(
                alertViewModel: alertViewModel,
                settings: SettingsViewModel(alertPresenter: alertViewModel)
            )
        }
    }
}
