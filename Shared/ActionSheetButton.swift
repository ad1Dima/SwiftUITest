import Foundation
import SwiftUI

struct ActionSheetButton<Label>: View where Label: View  {
    @State var isPresented: Bool = false
    var label: () -> Label
    var actionSheetTitle: String
    var actionSheetValues: [String]
    var selectedAction: (String) -> ()

    init(
        actionSheetTitle: String,
        actionSheetValues: [String],
        selectedAction: @escaping (String) -> (),
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.label = label
        self.actionSheetTitle = actionSheetTitle
        self.actionSheetValues = actionSheetValues
        self.selectedAction = selectedAction
    }
    var body: some View {
        Button(
            action: {
                isPresented = true
            },
            label: label
        ) 
        .confirmationDialog(actionSheetTitle, isPresented: $isPresented) {
            ForEach(actionSheetValues, id: \.self) { value in
                Button (
                    action: {
                        selectedAction(value)
                    }
                ) {
                    Text(value)
                }
            }
        }
    }
}
