# SwiftUITest
Test MVVM in Swift UI

# Presenting alerts from ViewModel 
Intresting case is [AlertPresenter](https://github.com/ad1Dima/SwiftUITest/blob/main/Shared/Alert/AlertViewModel.swift#L11) - protocol to show alert from view model when VM knows nothing about View

It's common case when ViewModel shuld know that it presenting some kind of message box, but ViewModel sholdn't know anything about View and technology it depends on (like SwiftUI). So `AlertPresenter` silly implementation of IoC pattern. so we can provide any AlertPresenter to ViewModel. In this project it is implemented around [alert presentation modifier](https://developer.apple.com/documentation/swiftui/view/alert(_:ispresented:actions:)-1bkka). But can also be implemented using local push for ex.

# ActionSheets in Lists
`ActionSheetButton` - custom View that can present ActionSheet on tap. As long activesheet are showing by the Bool propery, you need a Bool property per ActionSheet. In this case all presenting logic is on View part of MVVM.
