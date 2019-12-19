class MapStyleSheet: IStyleSheet {
  static func register(theme: Theme, colors: IColors, fonts: IFonts) {
    theme.add(className: "LayersTrafficButtonEnabled") { (s) -> (Void) in
      s.fontColor = colors.linkBlue
      s.mwmImage = "btn_menu_traffic_on"
    }
    theme.add(className: "LayersTrafficButtonDisabled") { (s) -> (Void) in
      s.fontColor = colors.blackSecondaryText
      s.mwmImage =  "btn_menu_traffic_off"
    }

    theme.add(className: "LayersSubwayButtonEnabled") { (s) -> (Void) in
      s.fontColor = colors.linkBlue
      s.mwmImage = "btn_menu_subway_on"
    }
    theme.add(className: "LayersSubwayButtonDisabled") { (s) -> (Void) in
      s.fontColor = colors.blackSecondaryText
      s.mwmImage = "btn_menu_subway_off"
    }

    theme.add(className: "StreetNameBackgroundView") { (s) -> (Void) in
      s.backgroundColor = colors.white
      s.shadowRadius = 2
      s.shadowColor = UIColor(0, 0, 0, alpha26)
      s.shadowOpacity = 1
      s.shadowOffset = CGSize(width: 0, height: 1)
    }

    theme.add(className: "PPRatingHorrible") { (s) -> (Void) in
      s.image = "ic_24px_rating_horrible"
      s.tintColor = colors.ratingRed
    }

    theme.add(className: "PPRatingBad") { (s) -> (Void) in
      s.image = "ic_24px_rating_bad"
      s.tintColor = colors.ratingOrange
    }

    theme.add(className: "PPRatingNormal") { (s) -> (Void) in
      s.image = "ic_24px_rating_normal"
      s.tintColor = colors.ratingYellow
    }

    theme.add(className: "PPRatingGood") { (s) -> (Void) in
      s.image = "ic_24px_rating_good"
      s.tintColor = colors.ratingLightGreen
    }

    theme.add(className: "PPRatingExellent") { (s) -> (Void) in
      s.image = "ic_24px_rating_excellent"
      s.tintColor = colors.ratingGreen
    }

    theme.add(className: "ButtonZoomIn") { (s) -> (Void) in
      s.mwmImage = "btn_zoom_in"
    }

    theme.add(className: "ButtonZoomOut") { (s) -> (Void) in
      s.mwmImage = "btn_zoom_out"
    }

    theme.add(className: "ButtonPending") { (s) -> (Void) in
      s.mwmImage = "btn_pending"
    }

    theme.add(className: "ButtonGetPosition") { (s) -> (Void) in
      s.mwmImage = "btn_get_position"
    }

    theme.add(className: "ButtonFollow") { (s) -> (Void) in
      s.mwmImage = "btn_follow"
    }

    theme.add(className: "ButtonFollowAndRotate") { (s) -> (Void) in
      s.mwmImage = "btn_follow_and_rotate"
    }

    theme.add(className: "ButtonMapBookmarks") { (s) -> (Void) in
      s.mwmImage = "ic_routing_bookmark"
    }

    theme.add(className: "PromoDiscroveryButton") { (s) -> (Void) in
      s.mwmImage = "promo_discovery_button"
    }

    theme.add(className: "FirstTurnView") { (s) -> (Void) in
      s.backgroundColor = colors.linkBlue
      s.cornerRadius = 4
      s.shadowRadius = 2
      s.shadowColor = colors.blackHintText
      s.shadowOpacity = 1
      s.shadowOffset = CGSize(width: 0, height: 2)
    }

    theme.add(className: "SecondTurnView", from: "FirstTurnView") { (s) -> (Void) in
      s.backgroundColor = colors.white
    }

    theme.add(className: "MapAutoupdateView") { (s) -> (Void) in
      s.shadowOffset = CGSize(width: 0, height: 3)
      s.shadowRadius = 6
      s.cornerRadius = 4
      s.shadowOpacity = 1
      s.backgroundColor = colors.white
    }

    theme.add(className: "PPReviewDiscountView") { (s) -> (Void) in
      s.backgroundColor = colors.linkBlue
      s.round = true
    }

    theme.add(className: "PPTitlePopularView") { (s) -> (Void) in
      s.backgroundColor = colors.linkBlueHighlighted
      s.round = true
    }

    theme.add(className: "RouteBasePreview") { (s) -> (Void) in
      s.borderColor = colors.blackDividers
      s.borderWidth = 1
      s.backgroundColor = colors.white
    }

    theme.add(className: "RoutePreview") { (s) -> (Void) in
      s.shadowRadius = 2
      s.shadowColor = colors.blackDividers
      s.shadowOpacity = 1
      s.shadowOffset = CGSize(width: 3, height: 0)
      s.backgroundColor = colors.pressBackground
    }
  }
}
