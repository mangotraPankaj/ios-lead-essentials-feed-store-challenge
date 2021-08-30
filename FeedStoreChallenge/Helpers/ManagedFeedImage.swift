//
//  ManagedFeedImage.swift
//  FeedStoreChallenge
//
//  Created by Pankaj Mangotra on 30/08/21.
//  Copyright © 2021 Essential Developer. All rights reserved.
//

import Foundation
import CoreData

@objc(ManagedFeedImage)
internal class ManagedFeedImage: NSManagedObject {
	@NSManaged internal var id: UUID
	@NSManaged internal var imageDescription: String?
	@NSManaged internal var location: String?
	@NSManaged internal var url: URL
	@NSManaged internal var cache: ManagedCache
}

extension ManagedFeedImage {
	var local: LocalFeedImage {
		return LocalFeedImage(id: id, description: imageDescription, location: location, url: url)
	}

	static func images(from localFeed: [LocalFeedImage], in context: NSManagedObjectContext) -> NSOrderedSet {
		return NSOrderedSet(array: localFeed.map { local in
			let managedImage = ManagedFeedImage(context: context)
			managedImage.id = local.id
			managedImage.imageDescription = local.description
			managedImage.location = local.location
			managedImage.url = local.url
			return managedImage
		})
	}
}
