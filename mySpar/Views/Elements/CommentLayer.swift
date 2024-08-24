//
//  CommentLayer.swift
//  mySpar
//
//  Created by АнтохаПрограммист on 24.08.2024.
//

import SwiftUI

/// Комментарий ("Акция" или "Новинка") в левом верхнем углу
struct CommentLayer: View {
    @EnvironmentObject var vm: ViewModel
    let comment: String?
    
    var body: some View {
        VStack {
            if let comment {
                HStack {
                    RoundedRectangle(cornerRadius: 3)
                        .foregroundStyle(comment == "Новинка" ? .green : .red)
                        .frame(width: 110, height: 20)
                        .overlay {
                            Text(comment)
                                .font(.caption2)
                                .foregroundStyle(.white)
                        }
                    Spacer()
                }
            }
            Spacer()
        }
    }
}
