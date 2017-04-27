//
//  uiview.swift
//  reversi
//
//  Created by 萬治佐友里 on 2017/04/27.
//  Copyright © 2017年 Monolith Works Inc. All rights reserved.
//

import UIKit

class ScreenView: UIView, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var tapGestureRecognizer: UITapGestureRecognizer!
    var callback: ((Int)->Void)?
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(sender:)))
        
        
        let collectionView = UICollectionView()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        //collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.addSubview(collectionView)
        
//        // Constraints
//        NSLayoutConstraint.activate([
//            collectionView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
//            collectionView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
//            collectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
//            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
//            ])
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 64
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = UIColor.lightGray
        
        // Init
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    /*
    convenience init(frame: CGRect, tapped: ((_ check: Int) -> Void)) {
        self.init(frame: frame)
    }
    
    func tap(sender: UITapGestureRecognizer){
        callback()
    }
 */
}
