struct Point: Hashable, Equatable {
    let x: Int
    let y: Int

    static func == (lhs:Point, rhs:Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}
