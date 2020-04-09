//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Stefan Steinbauer on 09.04.20.
//  Copyright © 2020 Stefan Steinbauer. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
