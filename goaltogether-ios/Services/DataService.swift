//
//  DataService.swift
//  goaltogether-ios
//
//  Created by Andrew Koo on 2/11/25.
//

import Foundation

protocol DataService {
    func fetchGroups() async throws -> [Group]
}
