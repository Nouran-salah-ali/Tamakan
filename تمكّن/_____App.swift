//___FILEHEADER___

import SwiftUI

@main
struct TamakanApp: App {
    @StateObject private var recViewModel = RecViewModel()

    var body: some Scene {
        WindowGroup {
            recView()
                .environmentObject(recViewModel)
        }
    }
}

