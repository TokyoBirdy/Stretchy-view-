//
//  ViewBinder.swift
//  StretchyView
//
//  Created by ceciliah on 10/25/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import Foundation
import UIKit

func bind(content:ViewModel, with view: StretchyView) {
    view.headerImageView.image = content.image
}
