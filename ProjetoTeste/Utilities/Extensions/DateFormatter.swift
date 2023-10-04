//
//  DateFormatter.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation

extension DateFormatter {
    static let customDateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd 'de' MMMM 'de' yyyy - HH:mm"
            return formatter
        }()
}
