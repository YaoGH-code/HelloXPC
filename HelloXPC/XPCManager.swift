import Foundation

class XPCManager {
    static let shared = XPCManager()
    private var connection: NSXPCConnection?

    private init() {
        connection = NSXPCConnection(serviceName: "john.HService")
        connection?.remoteObjectInterface = NSXPCInterface(with: HServiceProtocol.self)
        connection?.resume()
    }

    func performCalculation(firstNumber: Int, secondNumber: Int, completion: @escaping (Int) -> Void) {
        if let proxy = connection?.remoteObjectProxy as? HServiceProtocol {
            proxy.performCalculation(firstNumber: firstNumber, secondNumber: secondNumber, with: completion)
        }
    }
}

