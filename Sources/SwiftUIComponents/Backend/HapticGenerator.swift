//
//  HapticFeedback.swift
//  
//
//  Created by Alessio Rubicini on 04/01/21.
//

import Foundation
import SwiftUI

/// Allow to easily use haptic feedback on iOS with SwiftUI
public class HapticGenerator {
    
    public init() {}
    
    ///  Use impact feedback generators to indicate that an impact has occurred. For example, you might trigger impact feedback when a user interface object collides with something or snaps into place.
    /// - Parameter style: feedback style
    public func impactFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }

    
    /// Use notification feedback generators to indicate successes, failures, and warnings.
    /// - Parameter type: feedback type
    public func notificationFeedback(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(type)
    }
    
    /// Use selection feedback generators to indicate a change in selection.
    public func selectionFeedback() {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        generator.selectionChanged()
    }
    
}
