import SwiftUI
import Combine
import Fluxus

class ProfileState: FluxState, BindableObject {
  var didChange = PassthroughSubject<ProfileState, Never>()

  private static let defaultProfile = Profile(username: "John Appleseed!")

  var profile = defaultProfile {
    didSet {
      didChange.send(self)
    }
  }

  var draftProfile = defaultProfile {
    didSet {
      didChange.send(self)
    }
  }
}
