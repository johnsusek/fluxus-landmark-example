import Fluxus

class AppRootCommitter: RootCommitter {
  let landmarkCommitter = LandmarkCommitter()

  func commit(state rootState: RootState, mutation: Mutation) {
    guard let state = rootState as? AppRootState else { return }

    switch mutation {
    case is LandmarkMutation:
      landmarkCommitter.commit(state: state.landmarkState, mutation: mutation as! LandmarkMutation)
    default:
      print("Unknown mutation type: \(mutation)")
    }
  }
}
