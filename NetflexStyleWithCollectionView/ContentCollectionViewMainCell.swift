//
//  ContentCollectionViewMainCell.swift
//  NetflexStyleWithCollectionView
//
//  Created by YONGCHEOL LEE on 2021/12/01.
//

import UIKit
import SnapKit

class ContentCollectionViewMainCell: UICollectionViewCell {
    let baseStackView = UIStackView()
    let menuStackView = UIStackView()
    
    let tvButton = UIButton()
    let movieButton = UIButton()
    let categoryButton = UIButton()
    
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let contentStackView = UIStackView()
    
    let plusButton = UIButton()
    let playButton = UIButton()
    let infoButton = UIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [baseStackView, menuStackView].forEach {
            contentView.addSubview($0)
        }
        
        // base stack view
        baseStackView.axis = .vertical
        baseStackView.alignment = .center
        baseStackView.distribution = .fillProportionally
        baseStackView.spacing = 5
        
        [imageView, descriptionLabel, contentStackView].forEach {
            baseStackView.addArrangedSubview($0)
        }
        
        // imageView
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints {
            $0.width.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width)
        }
        
        // Description label
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.sizeToFit()
        
        // Content stack view
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.distribution = .equalCentering
        contentStackView.spacing = 20
        
        [plusButton, playButton, infoButton].forEach {
            contentStackView.addArrangedSubview($0)
        }
        
        [plusButton, infoButton].forEach {
            
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            $0.setTitleColor(.white, for: .normal)
            $0.imageView?.tintColor = .white
            $0.adjustVerticalLayout(5)
        }
        plusButton.setTitle("내가 찜한 콘텐츠", for: .normal)
        plusButton.setImage(UIImage(systemName: "plus"), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        infoButton.setTitle("정보", for: .normal)
        infoButton.setImage(UIImage(systemName: "info.circle"), for: .normal)
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
        playButton.setTitle("▶︎ 재생", for: .normal)
        playButton.setTitleColor(.black, for: .normal)
        playButton.backgroundColor = .white
        playButton.layer.cornerRadius = 3
        
        playButton.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.height.equalTo(30)
        }
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        
        baseStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        // menu stack view
        menuStackView.axis = .horizontal
        menuStackView.alignment = .center
        menuStackView.distribution = .equalSpacing
        menuStackView.spacing = 20
        
        [tvButton, movieButton, categoryButton].forEach {
            menuStackView.addArrangedSubview($0)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 3
        }
        
        tvButton.setTitle("TV 프로그램", for: .normal)
        movieButton.setTitle("영화", for: .normal)
        categoryButton.setTitle("카테고리 ▼", for: .normal)
        
        tvButton.addTarget(self, action: #selector(tvButtonTapped), for: .touchUpInside)
        movieButton.addTarget(self, action: #selector(movieButtonTapped), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        
        
        menuStackView.snp.makeConstraints {
            $0.top.equalTo(baseStackView)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    @objc func tvButtonTapped(sender: UIButton) {
        showAlert(message: "tvButtonTapped")
    }
   
    @objc func movieButtonTapped(sender: UIButton) {
        showAlert(message: "movieButtonTapped")
    }
    
    @objc func categoryButtonTapped(sender: UIButton) {
        showAlert(message: "plusButtonTapped")
    }
    
    @objc func plusButtonTapped(sender: UIButton) {
        showAlert(message: "plusButtonTapped")
    }
    
    @objc func playButtonTapped(sender: UIButton) {
        showAlert(message: "playButtonTapped")
        
    }
    
    @objc func infoButtonTapped(sender: UIButton) {
        showAlert(message: "infoButtonTapped")
    }
    
    private func showAlert(message: String) {
        DispatchQueue.main.async {
            let alertVC = UIAlertController(title: "", message: message, preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertVC.addAction(alertAction)
            let rootVC = UIApplication.shared.windows.first?.rootViewController
            rootVC?.present(alertVC, animated: true, completion: nil)
        }
    }
}
