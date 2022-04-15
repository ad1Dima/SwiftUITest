import Foundation

class ExperimentViewModel : ObservableObject {

    private let experiment: Experiment
    private let experimentsManager: ExperimentsManager

    init(
        experiment: Experiment,
        experimentsManager: ExperimentsManager
    ) {
        self.experiment = experiment
        self.experimentsManager = experimentsManager
        self.value = experimentsManager.experiments[experiment] ?? "default"
    }

    var id: String { experiment.id }
    var title: String { experiment.title }
    @Published var value: String

    func SetValue(value: String) {
        experimentsManager.experiments[experiment] = value
        self.value = value
    }

}
