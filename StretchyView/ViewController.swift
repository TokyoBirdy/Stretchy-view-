//
//  ViewController.swift
//  StretchyView
//
//  Created by ceciliah on 10/25/18.
//  Copyright © 2018 Humlan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var stretchyView: StretchyView!
    private let viewModel: ViewModel!

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        createScrollView()
        setupConstraints()
        bind(content: viewModel, with: stretchyView)
        #if DEBUG
        self.view.backgroundColor = UIColor.random.withAlphaComponent(0.1)
        #endif
    }

    private func createScrollView() {
        stretchyView = StretchyView(forConstraints: false)
        view.addSubview(stretchyView)
    }

    private func setupConstraints() {
        let constraints: [NSLayoutConstraint] = constrain(view: stretchyView, within: view, insets: .zero)
        constraints.activate()
    }


}
