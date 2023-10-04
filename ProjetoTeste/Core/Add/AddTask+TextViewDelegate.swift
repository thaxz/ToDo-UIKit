//
//  AddTask+TextViewDelegate.swift
//  ProjetoTeste
//
//  Created by thaxz on 04/10/23.
//

import Foundation
import UIKit

// Configuring TextView's UI

extension AddTaskViewController: UITextViewDelegate {
    
    func setupTextView(_ textView: UITextView, withPlaceholder placeholder: String) {
        textView.layer.cornerRadius = 8
        textView.text = placeholder
        textView.textColor = UIColor.lightGray
        textView.delegate = self
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
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
