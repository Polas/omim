import Foundation

protocol FirstLaunchPresenterProtocol: WelcomePresenterProtocol{
}

class FirstLaunchPresenter {
  enum Permission {
    case location
    case notifications
    case nothing
  }

  struct FirstLaunchConfig: WelcomeConfigProtocol{
    var image: UIImage?
    var title: String
    var text: String
    var buttonNextTitle: String
    var isCloseButtonHidden: Bool
    let requestPermission: Permission
  }

  private weak var viewController: WelcomeViewProtocol?
  private let router: WelcomeRouter
  private let config: FirstLaunchConfig

  init(viewController: WelcomeViewProtocol,
       router: WelcomeRouter,
       config: FirstLaunchConfig) {
    self.viewController = viewController
    self.router = router
    self.config = config
  }
}

extension FirstLaunchPresenter: FirstLaunchPresenterProtocol {
  func configure() {
    viewController?.configure(config: config)
  }

  func key() -> String {
    return FirstLaunchController.key
  }

  func onAppear() {
    switch config.requestPermission {
    case .location:
      MWMLocationManager.start()
    case .notifications:
      MWMPushNotifications.setup()
    case .nothing:
      break
    }
  }

  func onNext() {
    router.onNext()
  }

  func onClose() {
    router.onClose()
  }
}
