import Fluxus

class AppRootGetters: RootGetters<AppRootState> {
  lazy var landmark = LandmarkGetters(withState: rootState.landmarkState, usingGetters: self)
}
