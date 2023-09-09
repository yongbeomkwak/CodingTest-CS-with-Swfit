
//스플릿 이후 Int로 맵핑
let arr2 = str.split{$0 ==" "}.map{Int(String($0))!}

//조건으로 split
dartResult.split(whereSeparator: {$0.isNumber})