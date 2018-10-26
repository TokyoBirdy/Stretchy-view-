//
//  StretchyView
//  StretchyView
//
//  Created by ceciliah on 10/5/18.
//  Copyright © 2018 Humlan. All rights reserved.
//


import UIKit

//Scrollable content
class StretchyView:UIView {

    var scrollView:UIScrollView
    var headerView:UIView
    var headerImageView:UIImageView
    var bodyView:UIView

    override init(frame: CGRect) {

        scrollView = UIScrollView(forConstraints: false)
        headerView = UIView(forConstraints: false)
        bodyView = UIView(forConstraints: false)
        headerImageView = UIImageView(forConstraints: false)

        super.init(frame: frame)
        setupScrollView()
        setupHeaderView()
        setupImageView()
        setupBodyView()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    private func setupScrollView() {
        #if DEBUG
        scrollView.backgroundColor = UIColor.red.withAlphaComponent(0.2)
        #endif
        self.addSubview(scrollView)
    }

    private func setupHeaderView() {
        #if DEBUG
        headerView.backgroundColor = UIColor.yellow.withAlphaComponent(0.2)
        #endif
        scrollView.addSubview(headerView)
    }

    private func setupImageView() {
        headerImageView.contentMode = .scaleAspectFill
        headerImageView.clipsToBounds = false
        scrollView.addSubview(headerImageView)
    }

    private func setupBodyView() {
        #if DEBUG
        headerView.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        #endif
        scrollView.addSubview(bodyView)
    }

    private func setupConstraints() {
        var constraints: [NSLayoutConstraint] = constrain(view: scrollView, within: self, insets: .zero)
        //        let centerAnchor = scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        //        constraints.append(centerAnchor)

        let headerViewConstraints: [NSLayoutConstraint] = [
            headerView.leadingAnchor.constraint(equalTo:self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo:self.trailingAnchor),

            headerView.leadingAnchor.constraint(equalTo:scrollView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            headerView.topAnchor.constraint(equalTo:scrollView.topAnchor),
            headerView.heightAnchor.constraint(equalTo: scrollView.widthAnchor)
        ]

        constraints.append(contentsOf:headerViewConstraints)

        let headerImageViewConstraints:[NSLayoutConstraint] = [
            headerImageView.leadingAnchor.constraint(equalTo:headerView.leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo:headerView.trailingAnchor),
            headerImageView.topAnchor.constraint(equalTo:self.topAnchor),
            headerImageView.bottomAnchor.constraint(greaterThanOrEqualTo: headerView.bottomAnchor),
            headerImageView.heightAnchor.constraint(greaterThanOrEqualTo: self.widthAnchor)
        ]

        constraints.append(contentsOf: headerImageViewConstraints)

        let bodyConstraints:[NSLayoutConstraint] = [
            bodyView.widthAnchor.constraint(equalTo:self.widthAnchor),
            bodyView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            bodyView.topAnchor.constraint(equalTo:headerView.bottomAnchor),
            bodyView.heightAnchor.constraint(equalToConstant: 1000),
            bodyView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ]
        constraints.append(contentsOf: bodyConstraints)
        constraints.activate()
    }
}

