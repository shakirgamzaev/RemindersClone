//
//  ColorPickerView.swift
//  RemindersClone
//
//  Created by shakir Gamzaev on 15/10/24.
//

import SwiftUI

struct ColorPickerView: View {
    @Binding var selectedColor: Color
    let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple]
    
    var body: some View {
        HStack(spacing: 13) {
            ForEach(colors, id: \.self) { color in
                ZStack {
                    Circle()
                        .fill(color)
                        .frame(maxWidth: .infinity)
                    Circle()
                        .stroke(selectedColor == color ? Color(uiColor: .systemGray): .clear, lineWidth: 3)
                        .scaleEffect(1.2)
                }
                .onTapGesture {
                    selectedColor = color
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedColor = Color.orange
    
    ColorPickerView(selectedColor: $selectedColor)
        .padding(.horizontal)
}
