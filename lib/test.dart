void main(List<String> args) {
  List<String> url = [];
  List<String> open = [];
  List<List<String>> b = [
    ["url1", "url2", "url3"],
    ["open1", "open2", "open3"]
  ];
  for (var i = 0; i < b.length; i++) {
    for (var j = 0; j < b[i].length; j++) {
      if (i == 0) {
        url.add(b[i][j]);
      } else if (i == 1) {
        open.add(b[i][j]);
      }
    }
  }
  print(url);
  print(open);
}
