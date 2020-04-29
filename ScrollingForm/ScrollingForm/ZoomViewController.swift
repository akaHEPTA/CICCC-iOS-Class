//
//  ZoomViewController.swift
//  ScrollingForm
//
//  Created by Richard Cho on 2020-04-28.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        updateZoom()
    }
    
}

extension ZoomViewController: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func updateZoom() {
        let widthScale = view.bounds.size.width / imageView.bounds.size.width
        let height = view.bounds.size.height / imageView.bounds.size.height
        
        let scale = min(widthScale, height)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }
}
