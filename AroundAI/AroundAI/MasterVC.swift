//
//  MasterVC.swift
//  tapping view
//
//  Created by admin on 14/09/2017.
//  Copyright © 2017 MuhammadAamir. All rights reserved.
//

import UIKit

class MasterVC: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    lazy var ARKitVC: ARKitVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "ARKitVC") as! ARKitVC
        self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
        
    }()
    
    lazy var MapVC: MapVC = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        self.addViewControllerAsChildViewController(childViewController: viewController)
        return viewController
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupView()
    }
    
    func setupView(){
        segmentViewConfigure()
        updateView()
    }
    func updateView(){
        ARKitVC.view.isHidden = !(segmentControl.selectedSegmentIndex == 0)
        MapVC.view.isHidden = (segmentControl.selectedSegmentIndex == 0)
    }
    
    func segmentViewConfigure(){
        segmentControl.removeAllSegments()
        segmentControl.insertSegment(withTitle: "ARKitVC", at: 0, animated: false)
        segmentControl.insertSegment(withTitle: "MapVC", at: 1, animated: false)
        segmentControl.addTarget(self, action: #selector(selectDidChange(sender:)), for: .valueChanged)
        
        segmentControl.selectedSegmentIndex = 0
    }
    
    func selectDidChange(sender: UISegmentedControl){
        updateView()
    }

    // MARK: Helper Methods
    
    private func addViewControllerAsChildViewController(childViewController: UIViewController){
        addChildViewController(childViewController)
        view.addSubview(childViewController.view)
        
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        childViewController.didMove(toParentViewController: self)
    }
    
    private func removeViewControllerAsChildViewController(childViewController: UIViewController){
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
    }
}

