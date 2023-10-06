//
//  AddTask+TextViewDelegate.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation
import UIKit

// MARK: Configuring TextView's
/// Used UITextView for multiline input, allowing longer descriptions.
/// Implemented custom placeholder behavior using UITextViewDelegate,

extension AddTaskViewController: UITextViewDelegate {
    
    /// Sets up the appearance and behavior of the TextView with a placeholder text.
    func setupTextView(_ textView: UITextView, withPlaceholder placeholder: String) {
        textView.layer.cornerRadius = 8
        textView.text = placeholder
        textView.textColor = UIColor.lightGray
        textView.delegate = self
    }
    
    /// Handles the event when a user begins editing the TextView.
    /// Clears placeholder text and changes text color to black.
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    /// Handles the event when a user ends editing the TextView.
    /// If empty, restores placeholder text and color.
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            if textView == titleTextView {
                setupTextView(textView, withPlaceholder: "Digite o título da tarefa...")
            } else if textView == descriptionTextView {
                setupTextView(textView, withPlaceholder: "Digite a descrição da tarefa...")
            }
        }
    }
}
