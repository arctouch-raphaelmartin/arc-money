//
//  ArcMoneyCornerRadius.swift
//  ArcMoney
//
//  Created by Matheus Vaccaro on 11/26/24.
//

import Foundation

// MARK: - ArcMoneyCornerRadius

enum ArcMoneyCornerRadius {
    
    // MARK: Cases
    
    /// 0 pts of radius.
    case none
    /// 4 pts of radius.
    case quarter
    /// 8 pts of radius.
    case half
    /// 12 pts of radius.
    case threeQuarters
    /// 16 pts of radius.
    case one
    /// 20 pts of radius.
    case oneAndQuarter
    /// 24 pts of radius.
    case oneAndHalf
    /// 28 pts of radius.
    case oneAndThreeQuarters
    /// 32 pts of radius.
    case two
    /// 48 pts of radius.
    case three
    /// 64 pts of radius.
    case four
    /// Full radius. Creates a circle-like corner radii.
    case fullCircle
    /// Full radius. Creates a capsule-like corner radii.
    case fullCapsule
    
    // MARK: Internal Properties
    
    var value: CGFloat {
        switch self {
        case .none:
            0
        case .quarter:
            4
        case .half:
            8
        case .threeQuarters:
            12
        case .one:
            16
        case .oneAndQuarter:
            20
        case .oneAndHalf:
            24
        case .oneAndThreeQuarters:
            28
        case .two:
            32
        case .three:
            48
        case .four:
            64
        case .fullCircle, .fullCapsule:
            CGFloat.infinity
        }
    }
}
