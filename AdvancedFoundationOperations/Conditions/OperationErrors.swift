/*
 Copyright (C) 2015 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information

 Abstract:
 This file defines the error codes and convenience functions for interacting with Operation-related errors.
 */

import Foundation

let OperationErrorDomain = "OperationErrors"

enum OperationErrorCode: Int {

  case ConditionFailed = 1, ExecutionFailed

  // This makes it easy to compare an `NSError.code` to an `OperationErrorCode`.
  static func ==(lhs: Int, rhs: OperationErrorCode) -> Bool {
    return lhs == rhs.rawValue
  }

  static func ==(lhs: OperationErrorCode, rhs: Int) -> Bool {
    return lhs.rawValue == rhs
  }
}

extension NSError {

  convenience init(code: OperationErrorCode, userInfo: [String: Any]? = nil) {
    self.init(domain: OperationErrorDomain, code: code.rawValue, userInfo: userInfo)
  }
}

