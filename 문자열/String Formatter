func solution(_ today: String, _ terms: [String], _ privacies: [String]) -> [Int] {
    var answer: [Int] = []

    let formatter = DateFormatter()
    formatter.dateFormat = "YYYY.MM.dd" // 달력 포멧

    let today = formatter.date(from: today)!
    var termsDict: [String: Int] = [:]

    terms.forEach { term in
        let split = term.split(separator: " ").map { String($0) }
        termsDict[split[0]] = Int(split[1])!
    }

    for (i, privacy) in privacies.enumerated() {
        let split = privacy.split(separator: " ").map { String($0) }

        guard let date = formatter.date(from: split[0]), // 문자열을 통해 Date 객체로 
              let term = termsDict[split[1]] else {
            continue
        }

        let month = DateComponents(month: term) // Int 만큼 달로 
        let expiration = Calendar.current.date(byAdding: month, to: date)! // 해당 달 만큼 더해줌 

        if today >= expiration { // 대소 비교 
            answer.append(i + 1)
        }
    }

    return answer
}