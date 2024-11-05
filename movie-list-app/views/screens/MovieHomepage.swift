import SwiftUI

struct MovieHomepage: View {
    @StateObject var popularMovieViewModel = PopularMovieViewModel()
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.black
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor.darkGray
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor.darkGray
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    var body: some View {
        TabView {
            MovieListView(
                popularMovies: $popularMovieViewModel.popularMovies
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
            await popularMovieViewModel.getMovies()
            print(
                "The value of the Movie list is: \(popularMovieViewModel.popularMovies)"
            )
        }
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
    MovieHomepage()
}
