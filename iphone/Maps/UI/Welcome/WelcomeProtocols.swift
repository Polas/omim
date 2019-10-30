import Foundation

protocol WelcomeEntityProtocol{
  var image: UIImage { get }
  var title: String { get }
  var text: String { get }
  var buttonNextTitle: String { get }
  var isLaterButtonHidden: Bool { get }
}

protocol WelcomeViewProtocol: class {
  func setTitle(_ title: String)
  func setText(_ text: String)
  func setNextButtonTitle(_ title: String)
  func setTitleImage(_ titleImage: UIImage?)
  var isLaterButtonHidden: Bool {get set}
}

protocol WelcomePresenterProtocol: class{
  func configure()
  func onNext()
  func onLater()
}
