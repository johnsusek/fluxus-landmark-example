import SwiftUI
import Combine
import Fluxus

class HikeState: FluxState, BindableObject {
  var didChange = PassthroughSubject<HikeState, Never>()

  var hikes: [Hike] = LoadJSON("hikeData.json") {
    didSet {
      didChange.send(self)
    }
  }
}
