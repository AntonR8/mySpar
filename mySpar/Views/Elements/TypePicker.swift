//
//  Slider.swift
//  mySpar
//
//  Created by Антон Разгуляев on 20.08.2024.
//

import SwiftUI

struct TypePicker: View {
    @EnvironmentObject var vm: ViewModel
    var id: String
    @Binding var selection: String

    var body: some View {
        Picker("Pick", selection: $selection) {
            Text("Шт").tag("шт")
            Text("Кг").tag("кг")
        }
        .pickerStyle(SegmentedPickerStyle())
        .onChange(of: selection) {
            vm.changeMeasure(id: id, newMeasure: selection)
        }
    }
}
