import Foundation
import ReSwift

struct ChangeColorAction: Action {
    let direction: ColorChangingDirection

    init(direction: ColorChangingDirection) {
        self.direction = direction
    }
}
