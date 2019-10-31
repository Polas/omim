import Foundation

protocol WelcomeConfigProtocol{
  var image: UIImage? { get }
  var title: String { get }
  var text: String { get }
  var buttonNextTitle: String { get }
  var isCloseButtonHidden: Bool { get }
}

protocol WelcomePresenterProtocol: class{
  func configure()
  func key() -> String
  func onAppear()
  func onNext()
  func onClose()
}
