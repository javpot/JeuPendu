import Foundation

class MovieDownloader {
    let apiKey = "a8064f7d&"
    
    func fetchMovieTitle(completion: @escaping (String?) -> Void) {
        let randomId: String = ListeDeFilms.listeFilms.randomElement() ?? "tt0962736"
        let url: String = "https://www.omdbapi.com/?i=\(randomId)&apikey=\(apiKey)"
        
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    print("Erreur lors de la requête : \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                
                if let data = data {
                    do {
                        // Analyser la réponse JSON pour extraire le titre
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                            if let title = json["Title"] as? String {
                                print("Titre du film : \(title)")
                                completion(title)
                                
                            } else {
                                print("Titre non trouvé dans la réponse JSON.")
                                completion(nil)
                            }
                        }
                    } catch {
                        print("Erreur lors de l'analyse JSON : \(error.localizedDescription)")
                        completion(nil)
                    }
                }
            }
            task.resume()
            
        }
    }
}
