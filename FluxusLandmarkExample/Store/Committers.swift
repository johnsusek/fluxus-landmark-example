import Fluxus

struct LandmarkCommitter: Committer {
  func commit(state: LandmarkState, mutation: LandmarkMutation) -> LandmarkState {
    var state = state

    switch mutation {

    case .ToggleFavorite(let id):
      if let index = state.landmarks.firstIndex(where: { $0.id == id }) {
        state.landmarks[index].isFavorite.toggle()
      }

    case .SetParkDescription(let id, let parkDescription):
      if let index = state.landmarks.firstIndex(where: { $0.id == id }) {
        state.landmarks[index].parkDescription = parkDescription
      }
    }

    return state
  }
}
