//
//  welcomeModel.swift
//  Synergy
//
//  Created by Sachin Sharma on 26/01/24.
//

import Foundation

struct Welcome: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    static var smaplePage = Welcome(name: "Title Exapmle", description: "This is a sample data used for debugging", imageUrl: "getStarted1", tag: 0)
    
    static var samplePages: [Welcome] = [
        Welcome(name: "Welcome to the Synergy", description: "All tasks, meetingsand annual plans in one place are always at hand", imageUrl: "getStarted1", tag: 0),
        Welcome(name: "To Keep your life organized", description: "This smart tool is designed to help you manage your tasks", imageUrl: "getStarted2", tag: 1),
        Welcome(name: "How can we work together", description: "You create a task and we don't forget to remind you about it", imageUrl: "getStarted2", tag: 2)
    ]
}
