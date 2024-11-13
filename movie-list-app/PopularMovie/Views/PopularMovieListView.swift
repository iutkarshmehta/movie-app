//
//  movielist-view.swift
//  movie-list-app
//
//  Created by Mehta, Utkarsh on 25/10/24.
//

import SwiftUI

enum MovieTypes: String, CaseIterable {
    case popular = "Popular"
    case comingSoon = "Coming Soon"
    case topRated = "Top Rated"
}

struct PopularMovieListView: View {
    let movieTypes: [MovieTypes] = MovieTypes.allCases
    @Binding var popularMovies: [PopularMovie]
    @ObservedObject var popularMovieVM: PopularMovieViewModel
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(movieTypes, id: \.self) { type in
                            MovieStatusButton(
                                buttonTitle: type.rawValue,
                                isButttonClicked: false
                            )
                        }
                    }
                }
                .padding()
                .background(Color.black.opacity(0.85))
                .frame(alignment: .leading)
                cardView
            }
            .navigationDestination(for: PopularMovie.self) { movie in
                MovieDetailPage(movie: movie)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    @ViewBuilder var cardView: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(popularMovies, id: \.id) { movie in
                    NavigationLink(value: movie) {
                        CardView(movie: movie)
                            .padding(.bottom, 16)
                    }
                }
            }
            .padding(.top, 40)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    HStack {
                        Text("Watch Now")
                            .foregroundStyle(.white)
                            .font(.system(size: 35, weight: .bold))
                            .padding(.vertical, 40)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .bold))
                        .padding(.vertical, 40)
                }
            }
            .toolbarBackground(.black.opacity(0.8), for: .navigationBar)
            .toolbarBackgroundVisibility(
                .visible,
                for: .navigationBar
            )
        }
        .background(Color.black)
    }
}

// prievew enabled
#Preview {
    PopularMovieListView(
        popularMovies: .constant(
            [
                PopularMovie(
                    originalTitle: "The Batman",
                    overview: "BAtman movie was made by the Marvel studios",
                    voteAverage: 1.2,
                    releaseDate: "2024",
                    id: 121
                )
            ]),
        popularMovieVM: PopularMovieViewModel(movieService: MovieService(networkService: NetworkService()))
    )
}
