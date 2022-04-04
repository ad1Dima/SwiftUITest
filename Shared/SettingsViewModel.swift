//
//  SettingsManager.swift
//  SwiftUISettings
//
//  Created by Dmitrii Adodin on 01.04.2022.
//

import Foundation

class SettingsViewModel : ObservableObject {

    private let alertPresenter: AlertPresenter

    init(alertPresenter: AlertPresenter) {
        self.alertPresenter = alertPresenter
    }

    @Published var useSystemTheme : Bool = false
    @Published var useDarkTheme : Bool = true

    @Published var useOfflineMode : Bool = false {
        didSet {
                guard SettingsManager.sharedInstance.setOfflineMode(useOfflineMode) == useOfflineMode else {
                    alertPresenter.showMessage("You have no tracks downloaded") { [weak self] in
                        self?.useOfflineMode = false
                    }
                    return
                }
        }
    }


    @Published var boolSetting1 : Bool = false

    var opposideBoolSetting1 : Bool {
        get { !boolSetting1 }
        set {
            boolSetting1 = !newValue
        }
    }

    func downloadSomeTrack() {
        SettingsManager.sharedInstance.setHasDounloadedTracks(true)
    }

    func clearCache() {
        useOfflineMode = false
        SettingsManager.sharedInstance.setHasDounloadedTracks(false)
    }

}
