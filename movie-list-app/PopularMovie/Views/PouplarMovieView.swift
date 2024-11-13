import SwiftUI

struct PouplarMovieView: View {
    @StateObject private var popularMovieVM = PopularMovieViewModel(
        movieService: MovieService(networkService: NetworkService())
    )
    
    init() {
        UITabBar.appearance().barTintColor = UIColor.black
    }
    
    var body: some View {
        TabView {
            PopularMovieListView(
                popularMovies: $popularMovieVM.popularMovies,
                popularMovieVM: popularMovieVM
            )
            .tabItem {
                Image(systemName: "ellipsis")
            }
            
            VideoView()
                .tabItem {
                    Image(systemName: "video.fill")
                }
            
            BookmarkView()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                }
        }.task {
            await popularMovieVM.loadPopularMovies()
        }
        .tint(.green)
        .background(Color.yellow)
    }
}

struct VideoView: View {
    var body: some View {
        Text("VideoView")
    }
}

struct BookmarkView: View {
    var body: some View {
        Text("BookmarkView")
    }
}

#Preview {
    PouplarMovieView()
}
