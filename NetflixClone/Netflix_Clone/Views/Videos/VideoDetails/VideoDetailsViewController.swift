//
//  VideoDetailsViewController.swift
//  Netflix_Clone
//
//  Created by Shyngys Saktagan on 28.03.2021.
//  Copyright © 2021 JAYANTA GOGOI. All rights reserved.
//

import UIKit
import SnapKit

class VideoDetailsViewController: UIViewController {
    let viewModel: ViewDetailsViewModel
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32)
        label.textColor = .white
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.font = .systemFont(ofSize: 16)
        label.textColor = .systemGray
        label.textAlignment = .center
        return label
    }()
    
    private let yearLabel = VideoDetailsData(title: "Year")
    private let countryLabel = VideoDetailsData(title: "Country")
    private let durationLabel = VideoDetailsData(title: "Duration")
    private let directoryLabel = VideoDetailsData(title: "Director")
    private let typeLabel = VideoDetailsData(title: "Type")
    private let ratingLabel = VideoDetailsData(title: "Rating")
    
    private let stackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    } ()
    
    private let stackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    } ()
    
    init(viewModel: ViewDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .black
        setupUI()
    }
    
    private func setupUI() {
        [titleLabel, descriptionLabel, stackView1, stackView2].forEach { view.addSubview($0) }
        [yearLabel, countryLabel, durationLabel].forEach { stackView1.addArrangedSubview($0) }
        [directoryLabel, typeLabel, ratingLabel].forEach { stackView2.addArrangedSubview($0) }
        setupModel()
        setupConstraints()
    }
    
    private func setupModel() {
        titleLabel.text = viewModel.title
        descriptionLabel.text = viewModel.videoDescription
        yearLabel.setDescriptionLabel(text: viewModel.release_year)
        countryLabel.setDescriptionLabel(text: viewModel.coutry)
        durationLabel.setDescriptionLabel(text: viewModel.duration)
        directoryLabel.setDescriptionLabel(text: viewModel.director)
        typeLabel.setDescriptionLabel(text: viewModel.type)
        ratingLabel.setDescriptionLabel(text: viewModel.rating)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(32)
        }
        
        stackView1.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        stackView2.snp.makeConstraints {
            $0.top.equalTo(stackView1.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(stackView2.snp.bottom).offset(32)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(16)
        }
    }
}
