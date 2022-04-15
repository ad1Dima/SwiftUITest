import Foundation

class SettingsViewModel : ObservableObject {

    private let alertPresenter: AlertPresenter

    init(alertPresenter: AlertPresenter) {
        self.alertPresenter = alertPresenter

        experiments = []
        for experiment in ExperimentsManager.sharedInstance.experiments {
            experiments.append(ExperimentViewModel(experiment: experiment.key, experimentsManager: ExperimentsManager.sharedInstance))
        }
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
    @Published var experiments: [ExperimentViewModel]

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
