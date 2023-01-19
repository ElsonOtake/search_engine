import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "keyword" ]
  
  clear() {
    const input = document.querySelector("input")
    input.value = "";
  }

  input() {
    const articles = document.querySelectorAll("article")
    articles.forEach(article => {
      const isVisible = article.firstChild.nextSibling.text.toLowerCase().includes(this.keyword.toLowerCase());
      article.classList.toggle("hide", !isVisible);
    })
  }

  get keyword() {
    return this.keywordTarget.value
  }
}
