import Foundation

class GlobalStyleSheet: IStyleSheet {
  static func register(theme: Theme, colors: IColors, fonts: IFonts) {
    //Defaults
    theme.add(className: "TableView") { (s) -> (Void) in
      s.backgroundColor = colors.white
      s.separatorColor = colors.blackDividers
    }

    theme.add(className: "TableCell") { (s) -> (Void) in
      s.backgroundColor = colors.white
      s.fontColor = colors.blackPrimaryText
      s.tintColor = colors.blackPrimaryText
      s.fontColorDetailed = colors.blackSecondaryText
    }

    theme.add(className: "MWMTableViewCell") { (s) -> (Void) in
      s.backgroundColor = colors.white
      s.fontColor = colors.blackPrimaryText
      s.tintColor = colors.blackPrimaryText
      s.fontColorDetailed = colors.blackSecondaryText
      s.backgroundColorSelected = colors.pressBackground
    }

    theme.add(className: "TableViewHeaderFooterView") { (s) -> (Void) in
      s.font = fonts.medium14
      s.fontColor = colors.blackSecondaryText
    }
    
    theme.add(className: "SearchBar") { (s) -> (Void) in
      s.backgroundColor = colors.white
      s.barTintColor = colors.primary
      s.tintColor = colors.blackPrimaryText
      s.fontColor = colors.blackSecondaryText
    }

    theme.add(className: "NavigationBar") { (s) -> (Void) in
      s.barTintColor = colors.primary
      s.tintColor = colors.whitePrimaryText
      s.backgroundImage = UIImage()
      s.shadowImage = UIImage()
      s.font = fonts.regular18
      s.fontColor = colors.whitePrimaryText
    }

    theme.add(className: "NavigationButton") { (s) -> (Void) in
      s.font = fonts.regular18
      s.fontColor = colors.whitePrimaryText
      s.fontColorHighlighted = colors.whitePrimaryTextHighlighted
    }

    theme.add(className: "Checkmark") { (s) -> (Void) in
      s.onTintColor = colors.linkBlue
      s.offTintColor = colors.blackHintText
    }

    theme.add(className: "Switch") { (s) -> (Void) in
      s.onTintColor = colors.linkBlue
    }

    theme.add(className: "PageControl") { (s) -> (Void) in
      s.pageIndicatorTintColor = colors.blackHintText
      s.currentPageIndicatorTintColor = colors.blackSecondaryText
      s.backgroundColor = colors.white
    }

    //Global styles

    theme.add(className: "TableCellSeparator") { (s) -> (Void) in
      s.backgroundColor = colors.blackDividers
    }

    theme.add(className: "Divider") { (s) -> (Void) in
      s.backgroundColor = colors.blackDividers
    }

    //Backgounds
    theme.add(className: "Background") { (s) -> (Void) in
      s.backgroundColor = colors.white
    }

    theme.add(className: "PressBackground") { (s) -> (Void) in
      s.backgroundColor = colors.pressBackground
    }

    theme.add(className: "PrimaryBackground") { (s) -> (Void) in
      s.backgroundColor = colors.primary
    }

    theme.add(className: "SecondaryBackground") { (s) -> (Void) in
      s.backgroundColor = colors.secondary
    }

    theme.add(className: "MenuBackground") { (s) -> (Void) in
      s.backgroundColor = colors.menuBackground
    }

    theme.add(className: "BlackOpaqueBackground") { (s) -> (Void) in
      s.backgroundColor = colors.blackOpaque
    }

    theme.add(className: "BlueBackground") { (s) -> (Void) in
      s.backgroundColor = colors.linkBlue
    }

    theme.add(className: "ToastBackground") { (s) -> (Void) in
      s.backgroundColor = colors.toastBackground
    }

    theme.add(className: "FadeBackground") { (s) -> (Void) in
      s.backgroundColor = colors.fadeBackground
    }

    theme.add(className: "ErrorBackground") { (s) -> (Void) in
      s.backgroundColor = colors.errorPink
    }

    theme.add(className: "BlackStatusBarBackground") { (s) -> (Void) in
      s.backgroundColor = colors.blackStatusBarBackground
    }

    theme.add(className: "TabView") { (s) -> (Void) in
      s.backgroundColor = colors.pressBackground
      s.barTintColor = colors.primary
      s.tintColor = colors.white
      s.fontColor = colors.whitePrimaryText
      s.font = fonts.medium14
    }

    theme.add(className: "DialogView") { (s) -> (Void) in
      s.cornerRadius = 8
      s.shadowRadius = 2
      s.shadowColor = UIColor(0,0,0,alpha26)
      s.shadowOpacity = 1
      s.shadowOffset = CGSize(width: 0, height: 1)
      s.backgroundColor = colors.white
      s.clip = true
    }

    theme.add(className: "AlertView") { (s) -> (Void) in
      s.cornerRadius = 12
      s.shadowRadius = 6
      s.shadowColor = UIColor(0,0,0,alpha20)
      s.shadowOpacity = 1
      s.shadowOffset = CGSize(width: 0, height: 3)
      s.backgroundColor = colors.alertBackground
      s.clip = true
    }

    theme.add(className: "AlertViewTextField") { (s) -> (Void) in
      s.borderColor = colors.blackDividers
      s.borderWidth = 0.5
      s.backgroundColor = colors.white
    }

    theme.add(className: "SearchStatusBarView") { (s) -> (Void) in
      s.backgroundColor = colors.primary
      s.shadowRadius = 2
      s.shadowColor = colors.blackDividers
      s.shadowOpacity = 1
      s.shadowOffset = CGSize(width: 0, height: 0)
    }

    //
    theme.add(className: "FlatNormalButton") { (s) -> (Void) in
      s.font = fonts.medium14
      s.cornerRadius = 8
      s.clip = true
      s.fontColor = colors.whitePrimaryText
      s.backgroundColor = colors.linkBlue
      s.fontColorHighlighted = colors.whitePrimaryTextHighlighted
      s.fontColorDisabled = colors.whitePrimaryTextHighlighted
      s.backgroundColorHighlighted = colors.linkBlueHighlighted
    }

    theme.add(className: "FlatNormalButtonBig", from: "FlatNormalButton") { (s) -> (Void) in
      s.font = fonts.regular17
    }

    theme.add(className: "FlatNormalInvButton") { (s) -> (Void) in
      s.font = fonts.medium14
      s.cornerRadius = 8
      s.clip = true
      s.fontColor = colors.linkBlue
      s.backgroundColor = colors.clear
      s.fontColorHighlighted = colors.linkBlueHighlighted
      s.backgroundColorHighlighted = colors.clear
    }

    theme.add(className: "FlatNormalInvButtonBig", from: "FlatNormalInvButton") { (s) -> (Void) in
      s.font = fonts.regular17
    }

    theme.add(className: "FlatGrayTransButton") { (s) -> (Void) in
      s.font = fonts.medium14
      s.fontColor = colors.blackSecondaryText
      s.backgroundColor = colors.clear
      s.fontColorHighlighted = colors.linkBlueHighlighted
    }

    theme.add(className: "FlatRedTransButton") { (s) -> (Void) in
      s.font = fonts.medium14
      s.fontColor = colors.red
      s.backgroundColor = colors.clear
      s.fontColorHighlighted = colors.red
    }

    theme.add(className: "FlatRedTransButtonBig") { (s) -> (Void) in
      s.font = fonts.regular17
      s.fontColor = colors.red
      s.backgroundColor = colors.clear
      s.fontColorHighlighted = colors.red
    }

    theme.add(className: "FlatRedButton") { (s) -> (Void) in
      s.font = fonts.medium14
      s.cornerRadius = 8
      s.fontColor = colors.whitePrimaryText
      s.backgroundColor = colors.buttonRed
      s.fontColorHighlighted = colors.buttonRedHighlighted
    }

    theme.add(className: "MoreButton") { (s) -> (Void) in
      s.fontColor = colors.linkBlue
      s.fontColorHighlighted = colors.linkBlueHighlighted
      s.backgroundColor = colors.white
      s.font = fonts.regular16
    }

    theme.add(className: "EditButton") { (s) -> (Void) in
      s.font = fonts.regular14
      s.fontColor = colors.linkBlue
      s.cornerRadius = 8
      s.borderColor = colors.linkBlue
      s.borderWidth = 1
      s.fontColorHighlighted = colors.linkBlueHighlighted
      s.backgroundColor = colors.clear
    }

    theme.add(className: "RateAppButton") { (s) -> (Void) in
      s.font = fonts.medium17
      s.fontColor = colors.linkBlue
      s.fontColorHighlighted = colors.white
      s.borderColor = colors.linkBlue
      s.cornerRadius = 8
      s.borderWidth = 1
      s.backgroundColor = colors.clear
      s.backgroundColorHighlighted = colors.linkBlue
    }

    theme.add(className: "TermsOfUseText") { (s) -> (Void) in
      s.font = fonts.regular16
      s.fontColor = colors.blackPrimaryText

      s.linkAttributes = [NSAttributedString.Key.font: fonts.regular16,
                                     NSAttributedString.Key.foregroundColor: colors.linkBlue,
                                     NSAttributedString.Key.underlineColor: UIColor.clear]
      s.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }


    theme.add(className: "TermsOfUseGrayButton") { (s) -> (Void) in
      s.font = fonts.medium10
      s.fontColor = colors.blackSecondaryText
      s.fontColorHighlighted = colors.blackHintText
    }

    theme.add(className: "Badge") { (s) -> (Void) in
      s.round = true
      s.backgroundColor = colors.downloadBadgeBackground
    }

    //coloring
    theme.add(className: "MWMBlue") { (s) -> (Void) in
      s.tintColor = colors.linkBlue
      s.coloring = MWMButtonColoring.blue
    }
    theme.add(className: "MWMBlack") { (s) -> (Void) in
      s.tintColor = colors.blackSecondaryText
      s.coloring = MWMButtonColoring.black
    }
    theme.add(className: "MWMOther") { (s) -> (Void) in
      s.tintColor = colors.white
      s.coloring = MWMButtonColoring.other
    }
    theme.add(className: "MWMGray") { (s) -> (Void) in
      s.tintColor = colors.blackHintText
      s.coloring = MWMButtonColoring.gray
    }
    theme.add(className: "MWMSeparator") { (s) -> (Void) in
      s.tintColor = colors.blackDividers
      s.coloring = MWMButtonColoring.black
    }
    theme.add(className: "MWMWhite") { (s) -> (Void) in
      s.tintColor = colors.white
      s.coloring = MWMButtonColoring.white
    }
  }
}
