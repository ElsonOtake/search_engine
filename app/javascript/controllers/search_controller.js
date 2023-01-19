import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "keyword" ];

  clear() {
    const input = document.querySelector("input");
    const articles = document.querySelectorAll("article");
    input.value = ""; 
    articles.forEach(article => {
      article.classList.remove("hide");
    })
  }

  input() {
    clearTimeout(this.timeout)
    this.timeout = setTimeout(() => {
      console.log('keyword', this.keyword);
    }, 3000)
    const articles = document.querySelectorAll("article")
    articles.forEach(article => {
      const isVisible = this.keyword.every((key) => article.firstChild.nextSibling.text.toLowerCase().includes(key))
      article.classList.toggle("hide", !isVisible);
    })
  }

  get keyword() {
    return this.keywordTarget.value.toLowerCase().split(" ");
  }
}
