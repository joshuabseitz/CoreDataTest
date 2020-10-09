//
//  PersistenceController.swift
//  CoreDataTest
//
//  Created by Josh on 10/9/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import Foundation
import CoreData

struct PersistenceController {
	
	static var container: NSPersistentContainer!
	
	static func save(_ person: Person) {
		container.viewContext.insert(person)
		try! container.viewContext.save()
	}
	
	static func getAllPeople() -> [Person] {
		let personFetchRequest: NSFetchRequest<Person> = Person.fetchRequest()
//		personFetchRequest.predicate = NSPredicate(format: "Name", "Joshua") // How to get a specific result.
		let personResult = try! container.viewContext.fetch(personFetchRequest)
		return personResult
	}
	
	static func delete(_ person: Person) {
		container.viewContext.delete(person)
		try! container.viewContext.save()
	}
}
