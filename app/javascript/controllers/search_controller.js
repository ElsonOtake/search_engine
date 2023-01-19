import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "keyword" ]
  const articles = document.querySelectorAll("article")

  search() {

  }

  input() {
    articles.forEach(article => {
      // console.log(elem.firstChild.nextSibling.text);
      // console.log(elem.className);
      const isVisible = article.firstChild.nextSibling.text.toLowerCase().includes(this.keyword.toLowerCase());
      article.classList.toggle("hide", !isVisible);
    })
  }

  get keyword() {
    return this.keywordTarget.value
  }
}
