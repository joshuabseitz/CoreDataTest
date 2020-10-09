//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Josh on 10/9/20.
//  Copyright © 2020 Joshua Seitz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		let person = Person(context: PersistenceController.container.viewContext)
		person.name = "Joshua"
		person.age = 22
		
		PersistenceController.save(person)
		
		let savedPeople = PersistenceController.getAllPeople()
		
		// Get saved data
		print("Found \(savedPeople.count) people")
		
		for person in savedPeople {
			print(person.name)
		}
	}
}

