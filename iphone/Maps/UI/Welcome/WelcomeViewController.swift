class WelcomeViewController: MWMViewController, WelcomeViewProtocol {
  var presenter: WelcomePresenterProtocol?

  @IBOutlet private var image: UIImageView!
  @IBOutlet private var alertTitle: UILabel!
  @IBOutlet private var alertText: UILabel!
  @IBOutlet private var nextButton: UIButton!
  @IBOutlet private var laterButton: UIButton!
  @IBOutlet private var laterButtonHeightConstraint: NSLayoutConstraint!

  var isLaterButtonHidden: Bool = false{
    didSet{
      laterButtonHeightConstraint.constant = isLaterButtonHidden ? 0 : 32
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.configure()
  }

  func setTitle(_ title: String){
    alertTitle.text = title;
  }

  func setText(_ text: String){
    alertText.text = text;
  }

  func setNextButtonTitle(_ title: String){
    nextButton.setTitle(title, for: .normal)
  }

  func setTitleImage(_ titleImage: UIImage?){
    image.image = titleImage
  }

  @IBAction func onNextButton(_ sender: UIButton) {
    presenter?.onNext()
  }

  @IBAction func onLaterButton(_ sender: UIButton) {
    presenter?.onLater()
  }

}
