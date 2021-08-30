//
//  ManagedCache.swift
//  FeedStoreChallenge
//
//  Created by Pankaj Mangotra on 30/08/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import CoreData

@objc(ManangedCache)
internal class ManagedCache: NSManagedObject {
	@NSManaged internal var timestamp: Date
	@NSManaged internal var feed: NSOrderedSet
}
