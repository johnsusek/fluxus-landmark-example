import SwiftUI
import Combine
import Fluxus

class PreferencesState: FluxState, BindableObject {
  var didChange = PassthroughSubject<PreferencesState, Never>()

  var showFavoritesOnly = false {
    didSet {
      didChange.send(self)
    }
  }
}
