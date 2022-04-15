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
                        alertViewModel.buttonPressed(buttonId: 0)
                    }
                }
    }
}
