import UIKit
import ReSwift

let colors: [UIColor] = [UIColor.yellow, UIColor.green, UIColor.blue, UIColor.brown, UIColor.cyan]

enum ColorChangingDirection {
    case next
    case prev
}

struct ColorReducer: Reducer {
    typealias ReducerStateType = ColorState

    func handleAction(action: Action, state: ColorState?) -> ColorState {

        var state = state ?? ColorState()

        switch action {
        case let action as ChangeColorAction:
            state.color = changeColor(current: state.color, direction: action.direction)
        default:
            break
        }

        return state
    }

    private func changeColor(current: UIColor, direction: ColorChangingDirection) -> UIColor {
        guard let index = colors.index(of: current) else {
            return current
        }

        if direction == .next && index >= (colors.count - 1) {
            return colors.first ?? current
        }

        if direction == .prev && index == 0 {
            return colors.last ?? current
        }

        return direction == .next ? colors[index + 1] : colors[index - 1]
    }
}
