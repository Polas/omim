import UIKit

@objc class PromoCoordinator: NSObject {
  @objc enum PromoType: Int{
    case crown, discoveryGuide, discoverySubscribe, discoveryFree
  }

  private weak var mapViewController: MapViewController?
  let type: PromoType

  @objc init(viewController: MapViewController, type: PromoType) {
    self.mapViewController = viewController
    self.type = type
  }

  func openPromo(completion: @escaping ()->()) {
    switch type {
    case .crown:
      openBookmarksSubscription(completion: completion);
    case .discoveryGuide, .discoverySubscribe, .discoveryFree:
      openPromoDiscoveryOnboarding(completion: completion)
    }
  }

  func openDiscovery(inViewController viewController: UIViewController) {
    switch type {
    case .crown:
      print("err")
    case .discoveryGuide:
      openPromoDiscoveryGuide(inViewController: viewController)
    case .discoverySubscribe:
      openPromoDiscoverySubscribe(inViewController: viewController)
    case .discoveryFree:
      openPromoDiscoveryFree(inViewController: viewController)
    }
  }

  private func openBookmarksSubscription(completion: @escaping ()->()) {
    let subscribeViewController = BookmarksSubscriptionViewController()
    subscribeViewController.onSubscribe = {[weak self] in
      self?.mapViewController?.dismiss(animated: true, completion: nil)
      let successDialog = SubscriptionGoToCatalogViewController(onOk: {
        self?.mapViewController?.dismiss(animated: true, completion: nil)
        self?.mapViewController?.openCatalog(animated: true, utm: MWMUTM.crownButton)
      }) {
        self?.mapViewController?.dismiss(animated: true, completion: nil)
      }
      self?.mapViewController?.present(successDialog, animated: true, completion: nil)
    }
    subscribeViewController.onCancel = {[weak self] in
      self?.mapViewController?.dismiss(animated: true, completion: nil)
    }
    subscribeViewController.source = kStatSponsoredButton
    mapViewController?.present(subscribeViewController, animated: true, completion: {
      completion()
    })
    MWMEye.crownClicked()
  }

  private func openPromoDiscoveryOnboarding(completion: @escaping ()->()) {
    let sb = UIStoryboard.instance(.welcome)
    let vc = sb.instantiateViewController(withIdentifier: "PromoDiscoverViewController") as! PromoDiscoverViewController
    vc.setCoordinator(coordinator: self)
    vc.modalPresentationStyle = .fullScreen
    mapViewController?.present(vc, animated: true, completion: {
      completion()
    })
  }

  private func openPromoDiscoveryGuide(inViewController viewController: UIViewController) {
    mapViewController?.dismiss(animated: true, completion: nil)
    let webViewController = CatalogWebViewController.catalogFromAbsoluteUrl(nil, utm: .bookmarksPageCatalogButton)
    mapViewController?.navigationController?.pushViewController(webViewController, animated: true)
  }

  private func openPromoDiscoverySubscribe(inViewController viewController: UIViewController) {
    let subscribeViewController = AllPassSubscriptionViewController()
    subscribeViewController.onSubscribe = { [weak self] in
      self?.mapViewController?.dismiss(animated: true)
      let successDialog = SubscriptionSuccessViewController { [weak self] in
        self?.mapViewController?.dismiss(animated: true)
      }
      self?.mapViewController?.present(successDialog, animated: true)
    }
    subscribeViewController.onCancel = { [weak self] in
      self?.mapViewController?.dismiss(animated: true)
    }

    viewController.present(subscribeViewController, animated: true)
  }

  private func openPromoDiscoveryFree(inViewController viewController: UIViewController) {
    mapViewController?.dismiss(animated: true, completion: nil)
    let webViewController = CatalogWebViewController.catalogFromAbsoluteUrl(nil, utm: .bookmarksPageCatalogButton)
    mapViewController?.navigationController?.pushViewController(webViewController, animated: true)
  }

}
