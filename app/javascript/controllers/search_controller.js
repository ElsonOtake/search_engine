import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = [ "keyword" ];

  connect() {
    // Tracks the analytic record for the *current* search session.
    // Reset to null whenever the search box is emptied/reset, so the
    // next keystroke starts a new record instead of reusing a stale one.
    this.analyticId = null;
  }

  update_count(count) {
    const found = document.querySelector(".found");
    if (count === 1) {
      found.innerText = "1 article found";
    } else {
      found.innerText = `${count} articles found`;
    };
  }

  basePath() {
    const userId = window.location.pathname.split("/")[2];
    return `../../../api/v1/people/${userId}/analytics`;
  }

  async store_analytic(analytic) {
    const headers = {
      "Content-Type": "application/json",
      Accept: "application/json"
    };
 
    if (!this.analyticId) {
      // First keystroke of this search: create the record.
      const response = await fetch(this.basePath(), {
        method: "POST",
        headers,
        body: JSON.stringify(analytic)
      });
      const created = await response.json();
      this.analyticId = created.id;
    } else {
      // Same session: update the existing record with the latest keyword.
      await fetch(`${this.basePath()}/${this.analyticId}`, {
        method: "PATCH",
        headers,
        body: JSON.stringify(analytic)
      });
    }
  }

  reset() {
    const input = document.querySelector(".keyword");
    const articles = document.querySelectorAll(".card");
    input.value = "";
    this.analyticId = null; // next input() starts a brand new record
    let count = 0;
    articles.forEach(article => {
      article.classList.remove("hide");
      count++;
    })
    this.update_count(count);
  }

  input() {
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

    const currentKeyword = this.keywordTarget.value.trim().toLowerCase();
    if (currentKeyword.length === 0) {
      this.analyticId = null;
      return;
    }
 
    this.store_analytic({
      keyword: currentKeyword,
      results: count,
    });
  }

  get keyword() {
    return this.keywordTarget.value.toLowerCase().split(" ");
  }
}
