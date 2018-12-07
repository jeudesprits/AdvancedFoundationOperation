/*
    Copyright (C) 2015 Apple Inc. All Rights Reserved.
    See LICENSE.txt for this sample’s licensing information
    
    Abstract:
    An extension to NSLock to simplify executing critical code.
*/

import Foundation

extension NSLock {

    func withCriticalSection<T>(section: () -> T) -> T {
        lock()
        let value = section()
        unlock()
        return value
    }
}
