import SwiftUI
import Combine
import Fluxus

class LandmarkState: FluxState, BindableObject {
  var didChange = PassthroughSubject<LandmarkState, Never>()

  var landmarks: [Landmark] = LoadJSON("landmarkData.json") {
    didSet {
      didChange.send(self)
    }
  }
}
