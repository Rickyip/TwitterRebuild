//
//  HomeDatasourceController.swift
//  TwitterRebuild
//
//  Created by RickYip on 15/7/2018.
//  Copyright © 2018年 RickYip. All rights reserved.
//

import LBTAComponents
import TRON

class HomeDatasourceController: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0 // wrap text
        label.isHidden = true
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview() // LBTA method call
        
        collectionView?.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        
        setupNavigationBarItems()
        
        Service.sharedInstance.fetchHomeFeed { (homeDatasource, err) in
            if let err = err {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = err as? APIError<Service.JSONError> {
                    if let code = apiError.response?.statusCode {
                        switch code {
                            case 200:
                                self.errorMessageLabel.text = "JSON parsing ERROR\n"
                            case 404:
                                self.errorMessageLabel.text = "Netwoek ERROR\n"
                            default:
                                self.errorMessageLabel.text = "Apologies something went wrong. Please try again later..."
                        }
                    }
                }
                
                return
            }
            self.datasource = homeDatasource
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        // will re-layout when the screen is rotated
        collectionViewLayout.invalidateLayout()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        // 0 spacing between each item
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let user = self.datasource?.item(indexPath) as? User {
            // estimate the height of the cell based on the bio text
            
            // width - profile image view - space with the edge and padding
            let approximateWidthOfVioTextView = view.frame.width - 50 - 12 - 12 - 2
            // height is a abitary large number
            let size = CGSize(width: approximateWidthOfVioTextView, height: 1000)
            
            let attributes = [kCTFontAttributeName as NSAttributedStringKey: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
    
}
