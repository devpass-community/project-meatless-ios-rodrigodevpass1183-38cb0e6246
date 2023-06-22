import Foundation

struct Service {
    
    func fetchRestaurantList(completion: @escaping ([Restaurant]?)->Void) {
        
        let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/meatless-api/main/restaurant_list.json")!
                let request = URLRequest(url: url)
                
                let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let data = data {
                        
                        do {
                            let jsonDecoder = JSONDecoder()
                            let restaurants = try jsonDecoder.decode([Restaurant].self, from: data)
                            completion(restaurants)
                            
                        } catch {
                            completion([])
                        }
                    } else {
                        completion([])
                    }
                }
                
                dataTask.resume()
         
    }
}
