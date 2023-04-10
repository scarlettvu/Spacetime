//
//  ContentView.swift
//  Spacetime
//
//  Created by Scarlett  on 4/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationView{
            List{
                ForEach(vm.news,id: \.id ){ news in
                    VStack(alignment: .leading ){
                        AsyncImage(url: URL(string: news.imageUrl)) { Image in
                            Image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 350, height: 200)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                        VStack(alignment: .leading, spacing: 10){
                            Image(news.newsSite)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 30)
                            Text(news.title)
                                .foregroundColor(.purple)
                                .font(.title3)
                                .fontWeight(.bold)
                            Text(news.summary)
                                .foregroundColor(.gray)
                                .font(.callout)
                                .fontWeight(.bold)
                            Link(destination: URL(string: news.url)!, label: {
                                Text("")
                            })
                        }

                    }
                    
                    
                }
            }
            .listStyle(InsetListStyle())
            .task {
                vm.fetchData()
            }
        }
     
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
