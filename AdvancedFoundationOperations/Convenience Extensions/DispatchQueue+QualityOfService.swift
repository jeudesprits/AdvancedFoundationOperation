//
//  DispatchQueue+QualityOfService.swift
//  AdvancedFoundationOperations
//
//  Created by Ruslan Lutfullin on 12/8/18.
//  Copyright © 2018 jeudesprits. All rights reserved.
//

import Foundation

extension DispatchQueue {

  class func global(qos: QualityOfService) -> DispatchQueue {
    let rawQoS = qos_class_t(UInt32(qos.rawValue))
    let dispatchQoS = DispatchQoS.QoSClass(rawValue: rawQoS)!
    return global(qos: dispatchQoS)
  }
}
