//
//  RatingView.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 28/10/24.
//

import SwiftUI

struct RatingView: View {
    let rating: Double
    let maxRating: Int = 5
    let fromMovieDetail: Bool
    
    var body: some View {
        let starSize: CGFloat = fromMovieDetail ? 16 : 10
        HStack {
            ForEach(1...5, id: \.self) {index in
                if Double(index) <= rating {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: starSize))
                } else if Double(index) - 0.5 <= rating {
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                        .font(.system(size: starSize))
                } else {
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                        .font(.system(size: starSize))
                }
            }
        }
    }
}

#Preview {
    RatingView(rating: 2.0, fromMovieDetail: false)
}
