import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "keyword" ];

  update_count(count) {
    const found = document.querySelector(".found");
    if (count === 1) {
      found.innerText = "1 article found";
    } else {
      found.innerText = `${count} articles found`;
    };
  }

  store_analytic(analytic) {
    const configObj = {
      method: 'POST',
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json"
      },
      body: JSON.stringify(analytic)
    };
    let user_id = window.location.pathname.split("/")[2];
    fetch(`../../../api/v1/people/${user_id}/analytics`, configObj);
  }

  clear() {
    const input = document.querySelector(".keyword");
    const articles = document.querySelectorAll(".card");
    input.value = "";
    let count = 0;
    articles.forEach(article => {
      article.classList.remove("hide");
      count++;
    })
    this.update_count(count);
  }

  input() {
    clearTimeout(this.timeout);
    this.timeout = setTimeout(() => {
      this.store_analytic({
        keyword: this.keywordTarget.value.trim().toLowerCase(),
        results: count,
      })
    }, 2500);
    let count = 0;
    const articles = document.querySelectorAll(".card");
    articles.forEach(article => {
      const isVisible = this.keyword.every((key) => article.innerText.toLowerCase().includes(key));
      article.classList.toggle("hide", !isVisible);
      if (isVisible) {
        count++;
      }
    });
    this.update_count(count);
  }

  get keyword() {
    return this.keywordTarget.value.toLowerCase().split(" ");
  }
}
