import UIKit
import ReSwift

class ViewController: UIViewController {
    var colorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mainStore.subscribe(self) { state in
            state.colorState
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mainStore.unsubscribe(self)
    }

    func prevButtonTouched(_ sender: AnyObject?) {
        mainStore.dispatch(ChangeColorAction(direction: .prev));
    }

    func nextButtonTouched(_ sender: AnyObject?) {
        mainStore.dispatch(ChangeColorAction(direction: .next));
    }

    private func setupUI() {
        colorView = UIView()
        colorView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colorView)

        let buttonContainer = UIStackView()
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.axis = .horizontal
        buttonContainer.alignment = .center
        buttonContainer.distribution = .equalCentering

        let prevButton = UIButton(type: .system)
        prevButton.setTitle("Previous color", for: .normal)
        //prevButton.translatesAutoresizingMaskIntoConstraints = false
        prevButton.addTarget(self, action: #selector(prevButtonTouched), for: .touchUpInside)
        buttonContainer.addArrangedSubview(prevButton)

        let nextButton = UIButton(type: .system)
        nextButton.setTitle("Next color", for: .normal)
        //nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.addTarget(self, action: #selector(nextButtonTouched), for: .touchUpInside)
        buttonContainer.addArrangedSubview(nextButton)

        view.addSubview(buttonContainer)

        colorView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        colorView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8).isActive = true
        colorView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true

        buttonContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2).isActive = true
        buttonContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        buttonContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        buttonContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}

extension ViewController: StoreSubscriber {
    func newState(state: ColorState) {
        colorView.backgroundColor = state.color
    }
}
