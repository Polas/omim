class PromoDiscoverViewController: MWMViewController {
  @IBOutlet private var image: UIImageView!
  @IBOutlet private var alertTitle: UILabel!
  @IBOutlet private var alertText: UILabel!
  @IBOutlet private var nextButton: UIButton!
  @IBOutlet private var laterButton: UIButton!

  private var coordinator:PromoCoordinator?

  override func viewDidLoad() {
    super.viewDidLoad()
    switch coordinator?.type {
    case .discoveryGuide:
      image.image = UIImage(named: "img_onboarding_subscribeguides")
      alertTitle.text = L("new_onboarding_step5.1_header")
      alertText.text = L("new_onboarding_step5.1_message")
      nextButton.setTitle(L("new_onboarding_step5.1_button"), for: .normal)
    case .discoverySubscribe:
      image.image = UIImage(named: "img_onboarding_subscribeguides")
      alertTitle.text = L("new_onboarding_step5.2_header")
      alertText.text = L("new_onboarding_step5.2_message")
      nextButton.setTitle(L("new_onboarding_step5.2_button"), for: .normal)
    case .discoveryFree:
      image.image = UIImage(named: "img_onboarding_samples")
      alertTitle.text = L("new_onboarding_step5.3_header")
      alertText.text = L("new_onboarding_step5.3_message")
      nextButton.setTitle(L("new_onboarding_step5.3_button"), for: .normal)
    default:
      print("Error")
    }
  }

  func setCoordinator(coordinator: PromoCoordinator) {
    self.coordinator = coordinator
  }

  @IBAction func onNextButton(_ sender: UIButton) {
    coordinator?.openDiscovery(inViewController: self)
  }

  @IBAction func onLaterButton(_ sender: UIButton) {
    self.dismiss(animated: true, completion: nil)
  }
}
