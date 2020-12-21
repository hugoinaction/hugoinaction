export function  matchTemplate(content, data) {
  for (let pair of data) {
    let key = pair[0], value = pair[1];
    content = content.replaceAll(`[[${key}]]`, value);
  }
  return content;
}
