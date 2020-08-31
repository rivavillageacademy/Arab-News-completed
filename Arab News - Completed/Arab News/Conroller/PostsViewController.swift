import UIKit

class PostsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource=self
        newsTableView.delegate=self
        newsAPI.delegate=self
        
        newsAPI.fetchNews()
        
        // Do any additional setup after loading the view.
    }
    
    
    var newsArray=["News1", "News2","News3", "News4"]
    
    var newsAPI=NewsAPI()
    var articles=[Article(title:"",url:"")]
    

    @IBOutlet weak var newsTableView: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        //detailVC.urllink="Hello"
        
        let selectedRow = newsTableView.indexPathForSelectedRow?.row
        
        detailVC.urllink=articles[selectedRow!].url
        
    }
    
}


extension PostsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=UITableViewCell()
        cell.textLabel?.text=articles[indexPath.row].title
        return cell
    }
    
        
    
}

extension PostsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (indexPath.row)
        performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    
}



extension PostsViewController: NewsAPIDelegate {
    func didFetchPosts(posts: Posts) {
        print (posts)
        articles=posts.articles
        DispatchQueue.main.async{
            self.newsTableView.reloadData()
        }
        
    }
    
    func didFailWithError(error: Error?) {
        print (error)
    }
    
    
}



