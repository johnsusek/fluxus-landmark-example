import SwiftUI
import Combine
import Fluxus

final class RootStore: BindableObject {
  var didChange = PassthroughSubject<RootStore, Never>()

  var state = RootState() {
    didSet {
      didChange.send(self)
    }
  }

  func commit(_ mutation: Mutation) {
    switch mutation {
    case is LandmarkMutation:
      state.landmark = LandmarkCommitter().commit(state: self.state.landmark, mutation: mutation as! LandmarkMutation)
    default:
      print("Unknown mutation type!")
    }
  }

  func dispatch(_ action: Action) {
    switch action {
    case is LandmarkAction:
      LandmarkDispatcher(commit: self.commit).dispatch(action: action as! LandmarkAction)
    default:
      print("Unknown action type!")
    }
  }
}

