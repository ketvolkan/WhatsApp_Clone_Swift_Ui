import Foundation
public final class LocalJsonService: JsonDataLoaderProtocol {
    public static let shared = LocalJsonService()
    public init() {}
    public func load<T: Decodable>(_ type: T.Type, filename: String, withExtension: String) async throws -> T {
        try await Task.sleep(nanoseconds: 200_000_000) 
        var data: Data?
        if let bundleUrl = Bundle.main.url(forResource: filename, withExtension: withExtension) {
            data = try? Data(contentsOf: bundleUrl)
        }
        if data == nil {
            #if SWIFT_PACKAGE
            if let moduleUrl = Bundle.module.url(forResource: filename, withExtension: withExtension) {
                data = try? Data(contentsOf: moduleUrl)
            }
            #endif
        }
        if data == nil {
            let directPaths = [
                "Resources/\(filename).\(withExtension)",
                "./Resources/\(filename).\(withExtension)",
                "/Users/ketvolkan/.gemini/antigravity/scratch/WhatsAppClone/Resources/\(filename).\(withExtension)"
            ]
            for path in directPaths {
                let fileUrl = URL(fileURLWithPath: path)
                if let fileData = try? Data(contentsOf: fileUrl) {
                    data = fileData
                    break
                }
            }
        }
        guard let validData = data else {
            throw NSError(
                domain: "LocalJsonServiceError",
                code: 404,
                userInfo: [NSLocalizedDescriptionKey: "JSON dosyası bulunamadı: \(filename).\(withExtension)"]
            )
        }
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: validData)
    }
}
