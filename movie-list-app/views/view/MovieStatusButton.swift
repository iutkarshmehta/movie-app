//
//  MovieStatusButton.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 25/10/24.
//

import SwiftUI

struct MovieStatusButton: View {
    let buttonTitle: String
    var body: some View {
        ZStack{
            Button(buttonTitle, action: {})
                .buttonStyle(.borderedProminent)
                .tint(.gray)
                .clipShape(Capsule())
                .fontWeight(.bold)
        }
    }
}

#Preview {
    MovieStatusButton(buttonTitle: "")
}
