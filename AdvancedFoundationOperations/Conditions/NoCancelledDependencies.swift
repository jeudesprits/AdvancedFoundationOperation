/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 This file shows an example of implementing the OperationCondition protocol.
 */

import Foundation

/**
 A condition that specifies that every dependency must have succeeded.
 If any dependency was cancelled, the target operation will be cancelled as
 well.
 */
struct NoCancelledDependencies: OperationCondition {

  static let name = "NoCancelledDependencies"

  static let cancelledDependenciesKey = "CancelledDependencies"

  static let isMutuallyExclusive = false

  func dependencyForOperation(_ operation: Operation) -> Foundation.Operation? {
    return nil
  }

  func evaluateForOperation(_ operation: Operation, completion: (OperationConditionResult) -> ()) {
    // Verify that all of the dependencies executed.
    let cancelled = operation.dependencies.filter { $0.isCancelled }

    if !cancelled.isEmpty {
      // At least one dependency was cancelled; the condition was not satisfied.
      let error = NSError(
        code: .ConditionFailed,
        userInfo: [
          OperationConditionKey: NoCancelledDependencies.name,
          NoCancelledDependencies.cancelledDependenciesKey: cancelled
        ]
      )

      completion(.Failed(error))
    }
    else {
      completion(.Satisfied)
    }
  }
}
