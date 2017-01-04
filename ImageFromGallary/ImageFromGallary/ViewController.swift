//
//  ViewController.swift
//  ImageFromGallary
//


import UIKit
import Photos


class ViewController: UIViewController {
    var images: PHFetchResult<PHAsset>!
    var imageManager: PHCachingImageManager?
    let cellSize = CGSize(width: 100, height: 100)
    
    @IBOutlet weak var scrollview: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchImages()
    }

    func fetchImages()  {
        // Sorting condition
        let options = PHFetchOptions()
        options.sortDescriptors = [
            NSSortDescriptor(key: "creationDate", ascending: false)
        ]
        images = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: options)
        print(images)
        if images.count > 0 {
            
        }
        for i in 0 ..< images.count{
            self.imageManager = PHCachingImageManager()
            let asset = images[i]
            self.imageManager?.requestImage(for: asset,
                                                    targetSize: cellSize,
                                                    contentMode: .aspectFill,
                                                    options: nil) {
                                                        result, info in
                                                        if (result != nil) {
                                                            let imageview : UIImageView = UIImageView()
                                                            
                                                        imageview.frame = CGRect( x: CGFloat (i * 110), y: 0, width: 100, height: 100)
                                                            
                                                        imageview.image = result
                                                            
                                                        self.scrollview.addSubview(imageview)
                                                            
                                                            let index : CGFloat = CGFloat (self.images.count)
                                                            
                                                        self.scrollview.contentSize = CGSize(width: index * 110, height: 0)
                                                            
                                                            
                                                            print(result!)
                                                        }
                                                        
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


