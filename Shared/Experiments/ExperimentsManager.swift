import Foundation

class ExperimentsManager {

    static let sharedInstance = ExperimentsManager()

    var experiments: [Experiment:String] = [
        Experiment(id: "id1", title: "Experiment 1", values: ["on", "default"]) : "on",
        Experiment(id: "id2", title: "Experiment 2", values: ["on", "default"]) : "default",
        Experiment(id: "id3", title: "Experiment 3", values: ["on", "default", "control"]) : "on",
        Experiment(id: "id4", title: "Experiment 4", values: ["on", "default", "control"]) : "control",
    ]

    private init() {
    }
}
