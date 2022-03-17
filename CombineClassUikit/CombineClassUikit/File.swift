//
//  File.swift
//  CombineClassUikit
//
//  Created by Kyungyun Lee on 14/03/2022.
//

import Foundation
import UIKit
import Combine

class ViewController1 : UIViewController {
    
    private var cancellable : AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let publisher = (1...10).publisher
        
        self.cancellable = publisher
            .breakpoint(receiveOutput: { value in
                return value > 9
            })
            .sink {
                print($0)
            }
    }
    
    
}
