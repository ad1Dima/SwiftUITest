//
//  ContentView.swift
//  Shared
//
//  Created by Dmitrii Adodin on 01.04.2022.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var alertViewModel: AlertViewModel

    @ObservedObject var settings: SettingsViewModel

    var body: some View {
        VStack {
            Toggle(isOn: $settings.useSystemTheme) {
                Text("Use system theme")
            }
            Toggle(isOn: $settings.useDarkTheme) {
                Text("Use dark theme")
            }
            Spacer()
            Toggle(isOn: $settings.useOfflineMode) {
                Text("Use offline mode ")
            }
            Button(
                action: {
                    settings.downloadSomeTrack()
                }) {
                    Text("Download some track")
                }
                .padding()
            Button(
                action: {
                    settings.clearCache()
                }) {
                    Text("Clear cache")
                        .foregroundColor(Color.red)
                }
                .padding()
            Spacer()
            Toggle(isOn: $settings.boolSetting1) {
                Text("Bool setting")
            }
            Toggle(isOn: $settings.opposideBoolSetting1) {
                Text("opposide setting")
            }
            AlertView(alertViewModel: alertViewModel)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(
            alertViewModel: AlertViewModel(),
            settings: SettingsViewModel(
                alertPresenter: AlertViewModel()
            )
        )
    }
}
