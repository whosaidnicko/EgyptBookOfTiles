//
//  Bo.swift
//  EgyptBookOfTiles
//
//  Created by Nicolae Chivriga on 20/12/2024.
//

import SwiftUI


struct Bo: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image("greenBk")
                .resizable()
                .frame(width: 30, height: 30)
        }

        
    }
}
