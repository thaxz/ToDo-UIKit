//
//  DateFormatter.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation

// Extension to DateFormatter providing a pre-configured instance for date formatting.
// Format: "dd 'de' MMMM 'de' yyyy - HH:mm" (e.g., "04 de Outubro de 2023 - 14:30")

extension DateFormatter {
    static let customDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd 'de' MMMM 'de' yyyy - HH:mm"
            return formatter
        }()
}
