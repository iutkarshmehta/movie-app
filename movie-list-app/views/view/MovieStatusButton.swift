//
//  MovieStatusButton.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 25/10/24.
//

import SwiftUI

struct MovieStatusButton: View {
    let buttonTitle: String
    @State var isButttonClicked: Bool = false
    var body: some View {
        ZStack {
            Button(action: {
                isButttonClicked = isButttonClicked ? false : true
            }, label: {
                Text(buttonTitle)
            })
                .buttonStyle(.borderedProminent)
                .tint(isButttonClicked ? .green : .gray)
                .clipShape(Capsule())
                .fontWeight(.bold)
        }
    }
}

#Preview {
    MovieStatusButton(buttonTitle: "", isButttonClicked: false)
}
