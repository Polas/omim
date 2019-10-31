import Foundation

protocol PromoRouterPresenterProtocol: WelcomePresenterProtocol{

}

class PromoDiscoveryPresenter {
  private weak var viewController: WelcomeViewProtocol?
  private let router: PromoDiscoveryRouterProtocol
  private let type: PromoCoordinator.PromoType

  init(viewController: WelcomeViewProtocol,
       router: PromoDiscoveryRouterProtocol,
       type: PromoCoordinator.PromoType) {
    self.viewController = viewController
    self.router = router
    self.type = type;
  }
}

extension PromoDiscoveryPresenter: PromoRouterPresenterProtocol {
  func configure(){
    switch type {
    case .discoveryGuide:
      viewController?.setTitleImage(UIImage(named: "img_onboarding_subscribeguides"))
      viewController?.setTitle(L("new_onboarding_step5.1_header"))
      viewController?.setText(L("new_onboarding_step5.1_message"))
      viewController?.setNextButtonTitle(L("new_onboarding_step5.1_button"))
    case .discoverySubscribe:
      viewController?.setTitleImage(UIImage(named: "img_onboarding_subscribeguides"))
      viewController?.setTitle(L("new_onboarding_step5.2_header"))
      viewController?.setText(L("new_onboarding_step5.2_message"))
      viewController?.setNextButtonTitle(L("new_onboarding_step5.2_button"))
    case .discoveryFree:
      viewController?.setTitleImage(UIImage(named: "img_onboarding_samples"))
      viewController?.setTitle(L("new_onboarding_step5.3_header"))
      viewController?.setText(L("new_onboarding_step5.3_message"))
      viewController?.setNextButtonTitle(L("new_onboarding_step5.3_button"))
    default:
      print("Error")
    }
  }

  func key() -> String {
    return ""
  }

  func onAppear() {

  }

  func onNext() {
    router.presentNext()
  }

  func onClose(){
    router.dissmiss()
  }
}
