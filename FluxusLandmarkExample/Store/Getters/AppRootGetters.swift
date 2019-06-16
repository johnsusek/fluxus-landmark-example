import Fluxus

class AppRootGetters: RootGetters<AppRootState> {
  lazy var landmark = LandmarkGetters(withState: state.landmarkState, rootGetters: self, rootState: state)
}
