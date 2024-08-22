//
//  Slider.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import SwiftUI

struct TypePicker: View {
    @EnvironmentObject var vm: ViewModel
    @State var selection = "Шт"

    var body: some View {
        Picker("Pick", selection: $selection) {
            Text("Шт").tag("Шт")
        Text("Кг").tag("Кг")
        }
        .frame(height: 20)
        .pickerStyle(SegmentedPickerStyle())
//        .scaledToFill()
//        .scaleEffect(CGSize(width: 1.0, height: 0.8))

    }
}

#Preview {
    TypePicker()
}
