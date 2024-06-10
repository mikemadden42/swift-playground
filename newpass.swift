import Foundation

func generateRandomString(length: Int) -> String {
    let characters = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
    let charactersCount = UInt8(characters.count)
    let randomBytes = (0 ..< length).map { _ in UInt8.random(in: 0 ..< charactersCount) }
    let randomString = randomBytes.map { characters[Int($0)].description }.joined()
    return randomString
}

func main() {
    let arguments = CommandLine.arguments.dropFirst()

    for argument in arguments {
        guard let length = Int(argument) else {
            fputs("Error: Could not parse '\(argument)' as a valid number\n", stderr)
            exit(1)
        }

        let randomString = generateRandomString(length: length)
        print(randomString)
    }
}

main()
