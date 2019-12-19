class SubscriptionsStyleSheet: IStyleSheet {
  static func register(theme: Theme, colors: IColors, fonts: IFonts) {
    theme.add(className: "BookmarkSubscriptionScrollBackground") { (s) -> (Void) in
      s.backgroundColor = colors.bookmarkSubscriptionScrollBackground
    }
    
    theme.add(className: "BookmarkSubscriptionBackground") { (s) -> (Void) in
      s.backgroundColor = colors.bookmarkSubscriptionBackground
    }

    theme.add(className: "BookmarkSubscriptionFooterBackground") { (s) -> (Void) in
      s.backgroundColor = colors.bookmarkSubscriptionFooterBackground
    }

    theme.add(className: "BookmarksSubscriptionMonthlyButton") { (s) -> (Void) in
      s.font = fonts.medium14
      s.fontColor = colors.blackHintText
      s.borderWidth = 1
      s.cornerRadius = 6
      s.borderColor = colors.blackHintText
      s.backgroundColorHighlighted = colors.blackDividers
    }

    theme.add(className: "BookmarksSubscriptionDiscount", forType: .dark) { (s) -> (Void) in
      s.backgroundColor = colors.discountBackground
      s.cornerRadius = 6
      s.shadowRadius = 4
      s.shadowOffset = CGSize(width: 0, height: 2)
      s.shadowColor = colors.blackHintText
      s.shadowOpacity = 0.62
      s.fontColor = UIColor.white
      s.font = fonts.bold17
    }

    theme.add(className: "BookmarksSubscriptionDiscount", forType: .light) { (s) -> (Void) in
      s.backgroundColor = colors.discountBackground
      s.cornerRadius = 6
      s.fontColor = UIColor.white
      s.font = fonts.bold17
    }

    theme.add(className: "AllPassSubscriptionYearlyButton") { (s) -> (Void) in
      s.fontColorHighlighted = colors.white
      s.font = fonts.medium14
      s.cornerRadius = 6
      s.fontColor = colors.allPassSubscriptionDescription
      s.backgroundColor = colors.allPassSubscriptionSubTitle
      s.backgroundColorHighlighted = colors.linkBlueHighlighted
    }

    theme.add(className: "AllPassSubscriptionMonthlyButton") { (s) -> (Void) in
      s.fontColorHighlighted = colors.white
      s.font = fonts.medium14
      s.fontColor = colors.allPassSubscriptionMonthlyTitle
      s.cornerRadius = 6
      s.borderWidth = 1
      s.borderColor = colors.blackHintText
      s.backgroundColorHighlighted = colors.blackDividers
      s.backgroundColor = colors.allPassSubscriptionMonthlyBackground
    }

    theme.add(className: "AllPassSubscriptionRestoreButton") { (s) -> (Void) in
      s.font = fonts.medium14
      s.fontColor = colors.allPassSubscriptionDescription
      s.fontColorHighlighted = colors.linkBlueHighlighted
    }

    theme.add(className: "AllPassSubscriptionTerms") { (s) -> (Void) in
      s.font = fonts.regular9
      s.fontColor = colors.allPassSubscriptionTermsTitle
    }

    theme.add(className: "AllPassSubscriptionTermsButton") { (s) -> (Void) in
      s.font = fonts.regular9
      s.fontColor = colors.allPassSubscriptionTermsTitle
    }

    theme.add(className: "AllPassSubscriptionTitle") { (s) -> (Void) in
      s.font = fonts.medium10
      s.fontColor = colors.allPassSubscriptionTermsTitle
      s.fontColorHighlighted = colors.blackHintText
    }

    theme.add(className: "AllPassSubscriptionSubTitle") { (s) -> (Void) in
      s.font = fonts.fredokaRegular25
      s.fontColor = colors.allPassSubscriptionSubTitle
    }

    theme.add(className: "AllPassSubscriptionDescription1") { (s) -> (Void) in
      s.font = fonts.bold34
      s.fontColor = colors.allPassSubscriptionDescription
    }

    theme.add(className: "AllPassSubscriptionDescription2") { (s) -> (Void) in
      s.font = fonts.medium18
      s.fontColor = colors.allPassSubscriptionDescription
    }

    theme.add(className: "AllPassSubscriptionDiscount") { (s) -> (Void) in
      s.shadowRadius = 4
      s.shadowOffset = CGSize(width: 0, height: 2)
      s.shadowColor = colors.blackHintText
      s.shadowOpacity = 0.62
      s.cornerRadius = 6
      s.font = fonts.bold17
      s.fontColor = colors.discountText
      s.backgroundColor = colors.allPassSubscriptionDiscountBackground
    }


  }
}
