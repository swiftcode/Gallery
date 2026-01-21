//
//  Logger+Extension.swift
//  Gallery
//
//  Created by Michael Campbell on 1/19/26.
//

import SwiftUI
import OSLog

/// Extension that adds logging categories specific to this app
extension Logger {
    static let subsystem = Bundle.main.bundleIdentifier ?? "Gallery"
    static let api = Logger(subsystem: subsystem, category: "API")
    static let viewCycle = Logger(subsystem: subsystem, category: "ViewCycle")
}
