import ReSwift

struct AppReducer: Reducer {

    func handleAction(action: Action, state: AppState?) -> AppState {
        return AppState(
            colorState: ColorReducer().handleAction(action: action, state: state?.colorState)
        )
    }
    
}
