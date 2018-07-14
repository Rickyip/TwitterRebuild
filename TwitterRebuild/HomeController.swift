//
//  HomeController.swift
//  TwitterRebuild
//
//  Created by RickYip on 14/7/2018.
//  Copyright © 2018年 RickYip. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {
    
    let wordLabel: UILabel = {
       let label = UILabel()
        label.text = "123 Testing"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Error occur in required init?(coder aDecoder: NSCoder)")
    }
    
    func setupView() {
        backgroundColor = .yellow
        addSubview(wordLabel)
        NSLayoutConstraint.activate([
            wordLabel.topAnchor.constraint(equalTo: self.topAnchor),
            wordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            wordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            wordLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ])
    }
    
}

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellid = "cellid"
    let headerid = "headerid"
    let footerid = "footerid"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(WordCell.self, forCellWithReuseIdentifier: cellid)
        // register for header
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerid)
        // register for footer
        collectionView?.register(UICollectionViewCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerid)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // UICollectionViewController
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //UICollectionViewController
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // UICollectionViewDelegateFlowLayout
        
        return CGSize(width: view.frame.width, height: 50)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionElementKindSectionHeader {
            // for header
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerid, for: indexPath)
            header.backgroundColor = .blue
            return header
        } else {
            // for footer
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerid, for: indexPath)
            footer.backgroundColor = .blue
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
}
