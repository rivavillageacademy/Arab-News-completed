import Foundation

//1. create url
//2. create url session
//3. create task
//4. start / resume task

protocol NewsAPIDelegate {
    func didFetchPosts (posts: Posts)
    func didFailWithError (error: Error?)
}

struct NewsAPI {
    
    
    var delegate: NewsAPIDelegate?
    
    func fetchNews (){
        
        let urlString="https://newsapi.org/v2/top-headlines?sources=google-news-sa&apiKey=2524838879e349c8a7683c7496112fda"
        
        let url=URL(string: urlString)
        let urlSession=URLSession(configuration: .default)
        let task=urlSession.dataTask(with: url!) { (data, urlResponse, error) in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                
                do {
                    let thisPosts = try JSONDecoder().decode(Posts.self, from: data!)
                    
                    delegate?.didFetchPosts(posts: thisPosts)

                } catch
                {
                    print (error)
                }
                
                
                
                
                
            }
            

        }
        
        task.resume()
        
        
        
        
    }
    
}
