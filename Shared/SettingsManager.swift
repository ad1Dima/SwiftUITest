//
//  SettingsManager.swift
//  SwiftUISettings
//
//  Created by Dmitrii Adodin on 01.04.2022.
//

import Foundation

class SettingsManager {

    static let sharedInstance = SettingsManager()

    private init() {
    }

    private let kOfflineModeKey: String = "kOfflineModeKey"
    private let kHasDownloadedTracksKey: String = "kHasDownloadedTracksKey"
    private var settingsStorage: [String: Any] = [String: Any]()

    // Возвращаем применённое значение
    func setOfflineMode(_ mode: Bool) -> Bool {
        let currentMode = getSetting(kOfflineModeKey, defaultValue: false)
        guard currentMode != mode else {
            return currentMode
        }

        if mode,
           getSetting(kHasDownloadedTracksKey, defaultValue: false) == false {
            return currentMode
        }

        setSetting(kHasDownloadedTracksKey, value: mode)
        return mode
    }

    func setHasDounloadedTracks(_ value: Bool) {
        setSetting(kHasDownloadedTracksKey, value: value)
    }

    private func getSetting<T>(_ key: String, defaultValue: T) -> T {
        if let setting = settingsStorage[key] as? T {
            return setting
        }
        else {
            return defaultValue
        }
    }

    private func setSetting(_ key: String, value: Any) {
        settingsStorage[key] = value
    }
}
