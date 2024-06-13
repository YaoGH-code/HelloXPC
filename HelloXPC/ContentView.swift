import SwiftUI

struct ContentView: View {
    @State private var firstNumber: String = ""
    @State private var secondNumber: String = ""
    @State private var result: Int?

    var body: some View {
        VStack {
            TextField("Enter first number", text: $firstNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Enter second number", text: $secondNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                calculateResult()
            }) {
                Text("Calculate")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }

            if let result = result {
                Text("Result: \(result)")
                    .padding()
            }
        }
        .padding()
    }

    private func calculateResult() {
        // 验证并转换输入
        guard let first = Int(firstNumber), let second = Int(secondNumber) else {
            // 处理无效输入
            return
        }
        // 调用 XPC 服务
        XPCManager.shared.performCalculation(firstNumber: first, secondNumber: second) { result in
            DispatchQueue.main.async {
                self.result = result
            }
        }
    }
}

#Preview {
    ContentView()
}

