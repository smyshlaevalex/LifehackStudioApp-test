//
//  UICollectionView+Register.swift
//  LearnKana
//
//  Created by Alexander on 1/8/19.
//  Copyright © 2019 Alexander. All rights reserved.
//

import UIKit

extension UICollectionView {
    enum SupplementaryViewKind {
        case header
        case footer
        
        var elementKind: String {
            let elementKind: String
            switch self {
            case .header:
                elementKind = UICollectionView.elementKindSectionHeader
            case .footer:
                elementKind = UICollectionView.elementKindSectionFooter
            }
            
            return elementKind
        }
    }
    
    /**
     Register cell, will register nib if it exist,
     registering UICollectionViewCell is ok as long as only one is being registered
     */
    func register<Cell: UICollectionViewCell>(cell cellType: Cell.Type) {
        let cellName = String(describing: cellType)
        
        if Bundle.main.url(forResource: cellName, withExtension: "nib") != nil {
            let nib = UINib(nibName: cellName, bundle: nil)
            register(nib, forCellWithReuseIdentifier: cellName)
        } else {
            register(cellType, forCellWithReuseIdentifier: cellName)
        }
    }
    
    func register<SupplementaryView: UICollectionReusableView>(supplementaryView supplementaryViewType: SupplementaryView.Type, kind: SupplementaryViewKind) {
        let supplementaryViewName = String(describing: supplementaryViewType)
        
        if Bundle.main.url(forResource: supplementaryViewName, withExtension: "nib") != nil {
            let nib = UINib(nibName: supplementaryViewName, bundle: nil)
            register(nib, forSupplementaryViewOfKind: kind.elementKind, withReuseIdentifier: supplementaryViewName)
        } else {
            register(supplementaryViewType, forSupplementaryViewOfKind: kind.elementKind, withReuseIdentifier: supplementaryViewName)
        }
    }
    
    func dequeue<Cell: UICollectionViewCell>(cell cellType: Cell.Type, for indexPath: IndexPath) -> Cell {
        let cellName = String(describing: cellType)
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath) as? Cell else {
            fatalError("Couldn't cast cell to \(cellName)")
        }
        
        return cell
    }
    
    func dequeue<SupplementaryView: UICollectionReusableView>(supplementaryView supplementaryViewType: SupplementaryView.Type,
                                                              kind: SupplementaryViewKind,
                                                              for indexPath: IndexPath) -> SupplementaryView {
        let supplementaryViewName = String(describing: supplementaryViewType)
        
        guard let supplementaryView = dequeueReusableSupplementaryView(ofKind: kind.elementKind,
                                                                       withReuseIdentifier: supplementaryViewName,
                                                                       for: indexPath) as? SupplementaryView else {
            fatalError("Couldn't cast supplementary view to \(supplementaryViewName)")
        }
        
        
        return supplementaryView
    }
}
