//
//  SpaceNewsViewModel.swift
//  Spacetime
//
//  Created by Scarlett  on 4/10/23.
//

import Foundation
class ViewModel:ObservableObject{
    @Published var news:[SpacetimeNews] = []
    @Published var url = "https://api.spaceflightnewsapi.net/v3/articles"
    func fetchData(){
        guard let url = URL(string: url)else{return}
        let sess = URLSession.shared.dataTask(with: url){[weak self] data, _ ,error in
            
            guard let data = data, error == nil else {
                return
            
            }
            do{
                let news = try JSONDecoder().decode([SpacetimeNews].self, from: data)
                DispatchQueue.main.async {
                    self?.news = news
                }
            }catch{
                print(error as Any)
            }
            
        }
        sess.resume()
    }
}
