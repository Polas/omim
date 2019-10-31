import UIKit

protocol WhatsNewPresenterProtocol: WelcomePresenterProtocol {

}

class WhatsNewPresenter {
  struct WhatsNewConfig: WelcomeConfigProtocol{
    var image: UIImage?
    var title: String
    var text: String
    var buttonNextTitle: String
    var isCloseButtonHidden: Bool
  }

  private weak var view: WelcomeViewProtocol?
  private let router: WelcomeRouter
  private let config: WhatsNewConfig

  init(view: WelcomeViewProtocol, router: WelcomeRouter, config: WhatsNewConfig) {
     self.view = view
     self.router = router
    self.config = config
  }
}

extension WhatsNewPresenter: WhatsNewPresenterProtocol {
  func configure() {
    view?.configure(config: config)
  }

  func key() -> String {
    return WhatsNewController.key
  }

  func onAppear() {

  }

  func onNext() {
    router.onNext()
  }

  func onClose() {
    router.onClose()
  }
}
