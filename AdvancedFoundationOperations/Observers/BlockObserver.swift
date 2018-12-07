/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 This file shows how to implement the OperationObserver protocol.
 */

import Foundation

/**
 The `BlockObserver` is a way to attach arbitrary blocks to significant events
 in an `Operation`'s lifecycle.
 */
struct BlockObserver: OperationObserver {
  // MARK: Properties
  
  private let startHandler: ((Operation) -> ())?

  private let produceHandler: ((Operation, Foundation.Operation) -> ())?

  private let finishHandler: ((Operation, [NSError]) -> ())?

  init(
    startHandler: ((Operation) -> ())? = nil,
    produceHandler: ((Operation, Foundation.Operation) -> ())? = nil,
    finishHandler: ((Operation, [NSError]) -> ())? = nil
  ) {
    self.startHandler = startHandler
    self.produceHandler = produceHandler
    self.finishHandler = finishHandler
  }

  // MARK: OperationObserver

  func operationDidStart(_ operation: Operation) {
    startHandler?(operation)
  }

  func operation(_ operation: Operation, didProduceOperation newOperation: Foundation.Operation) {
    produceHandler?(operation, newOperation)
  }

  func operationDidFinish(_ operation: Operation, errors: [NSError]) {
    finishHandler?(operation, errors)
  }
}
