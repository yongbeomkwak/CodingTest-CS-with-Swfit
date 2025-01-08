func lowerBound(_ arr: [Int], _ x: Int) -> Int {
  var start = 0
  var end = arr.count-1
  
  while (start < end) {
    let mid = (start + end) / 2
    if arr[mid] >= x { end = mid }
    else { start = mid + 1}
  }

  return end
}

func upperBound(_ arr: [Int], _ x: Int) -> Int {
  var start = 0
  var end = arr.count-1
  
  while (start < end) {
    let mid = (start + end) / 2
    if arr[mid] > x { end = mid }
    else { start = mid + 1}
  }

  return end
}
