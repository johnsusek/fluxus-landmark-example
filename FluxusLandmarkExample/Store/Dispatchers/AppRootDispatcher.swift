import Fluxus

final class AppRootDispatcher: RootDispatcher {
  let landmarkDispatcher = LandmarkDispatcher()

  func dispatch(store: FluxStore, action: Action) {
    switch action {

    case is LandmarkAction:
      landmarkDispatcher.dispatch(store: store, action: action as! LandmarkAction)

    default:
      print("Unknown action type: \(action)")
    }
  }
}
