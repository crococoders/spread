//
//  SchulteTrainingCollectionViewDelegate.swift
//  Teztez
//
//  Created by Almas Zainoldin on 5/3/20.
//  Copyright © 2020 crococoders. All rights reserved.
//

import UIKit

private enum Constants {
    static let size = CGSize(width: 63, height: 63)
}

final class SchulteTrainingCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    private let store: SchulteTrainingStore

    init(store: SchulteTrainingStore) {
        self.store = store
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Constants.size
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        store.dispatch(action: .didSelectItemAt(index: indexPath.row))
    }
}
