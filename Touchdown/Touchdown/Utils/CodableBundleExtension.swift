//
//  CodableBundleExtension.swift
//  Touchdown
//
//  Created by Chris on 03/11/2021.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = url(forResource: file, withExtension: nil) else { fatalError() }
        guard let data = try? Data(contentsOf: url) else { fatalError() }
        
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(T.self, from: data) else { fatalError() }
        
        return decodedData
    }
}
