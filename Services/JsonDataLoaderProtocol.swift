import Foundation
public protocol JsonDataLoaderProtocol {
    func load<T: Decodable>(_ type: T.Type, filename: String, withExtension: String) async throws -> T
}
