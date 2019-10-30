import Foundation

protocol PromoRouterPresenterProtocol: WelcomePresenterProtocol{
  func configure()
  func onNext()
  func onLater()
}

class PromoDiscoveryPresenter: PromoRouterPresenterProtocol {
  private weak var viewController: WelcomeViewProtocol?
  private let router: PromoDiscoveryRouter
  private let config: WelcomeEntityProtocol

  init(viewController: WelcomeViewProtocol,
       router: PromoDiscoveryRouter ,
       config: WelcomeEntityProtocol) {
    self.viewController = viewController
    self.router = router
    self.config = config;
  }

  func configure(){
    viewController?.setTitleImage(config.image)
    viewController?.setTitle(config.title)
    viewController?.setText(config.title)
    viewController?.setNextButtonTitle(config.buttonNextTitle)
    viewController?.isLaterButtonHidden = config.isLaterButtonHidden
  }

  func onNext(){
    router.presentNext()
  }

  func onLater(){
    router.dissmiss()
  }
}
