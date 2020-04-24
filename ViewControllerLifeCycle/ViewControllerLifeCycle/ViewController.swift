//
//  ViewController.swift
//  ViewControllerLifeCycle
//
//  Created by Richard Cho on 2020-04-23.
//  Copyright © 2020 Richard Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad() // always let super call the lifecycle methods
        // When the view controller loads the `view` into memory.
        // do primary setup of your view controller here.
        // good time to update my view using my model, because my oultets are set!
        
        // * Do not do geometry-related setup here! Your bounds are not yet set!
        
        // This method gets called once when the view are loaded to the memory
        // 1. Initialization of views
        // 2. Network requests
        // 3. Database access
        
        print(#function)
    }
    // For work that will be performed multiple times, your app can rely on these view event notifications (lifecycle methods)
    
    // This method will be sent just before your ViewController appears (or re-appears) on the scree.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // catch my view up to date with what went on while I was off-screen
        
        // Note: this method can be called repeatedly (vs. viewDidLoad is only called once)
        // 1. Updating user location.
        // 2. Updating or refreshing some views.
        // 3. Starting a network requests
        // 4. Adjusting screen orientations. (portrait, landscape)
        
        print(#function)
    }
    
    // This method will be called just after your ViewController has finished appearing on screen.
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // start a timer or an animation or start observing something.
        
        // This is also a good place to start something expensive.
        // Why kick off expensive things here instead of in viewDidLoad?
        // Because we know we're on screen so it won't be a waste.
        // By "expensive" we usually mean "time consuming" but could also mean battery or storage.
        
        // We must never block our UI from user interaction (this background fetching, etc.)
        // Out UI might need to come up incomplete and later fill in when expensive operation is done.
        // We use "spinning wheels" and such to let the user know we're feting somthing expensive.
        // 1. start an animation
        // 2. long running code (expensive)
        
        print(#function)
    }
    
    // Gets called right before the view disappears from the screen.
    // Your viewcontroller is still on screen, but it's about to go off screen.
    // ex. when the user hit "back" in a UINavigationController
    //     the user switched to another tab in UITabBarController
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // often you just undo what you did in viewDidAppear
        // for example, stop a timer or animation you started in viewDidAppear or stop observing
        // 1. saving edits.
        // 2. hiding keyboards.
        // 3. canceling network requests or stopping an animation
        
        print(#function)
    }
    
    // Gets called right after the view disappears from the screen.
    // (usually after the user navigated to a new view)
    // Somewhat rare to do something here, but occasionally you might want to "clean up" yor viewcontroller
    // ex. you could save some state or release some large, recreatable resource.
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // clean up this viewcontroller
        // 1. stop services related to the view. (playing audio, removing notification observers)
        
        print(#function)
    }
    
    

    
    
}

