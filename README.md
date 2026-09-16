<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Author](#author)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Blog <a name="about-project"></a>

**Search engine** is a real-time articles search box. As a person types, results filter instantly and their search keyword is tracked live, with an analytics page displaying what users were searching for.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://stimulus.hotwired.dev/">Stimulus</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
    <li><a href="https://sass-lang.com/">Sass</a></li>
    <li><a href="https://github.com/rspec/rspec-rails">RSpec Rails</a></li>
    <li><a href="https://github.com/teamcapybara/capybara">Capybara</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **REST API**
- **Stimulus**
- **Real-time search with live analytics tracking**
- **Tests**
- **[API documentation](https://swagger.io/solutions/api-documentation/)**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LIVE DEMO -->

## 🚀 Live Demo <a name="live-demo"></a>

- [Live Demo Link](https://elsonotake-search-engine.onrender.com)

- [API documentation](https://elsonotake-search-engine.onrender.com/api-docs)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

[Ruby](https://www.ruby-lang.org/en/)

### Setup

Clone this repository to your desired folder:

using HTTPS:
```sh
  git clone https://github.com/ElsonOtake/Search_Engine.git
  cd Search_Engine
```

using an SSH key:
```sh
  https://github.com/ElsonOtake/search_engine.git
  cd Search_Engine
```

using GitHub CLI:
```sh
  git clone gh repo clone ElsonOtake/Search_Engine
  cd Search_Engine
```

### Install

Install this project with:
```sh
  bundle install
  rails db:create db:migrate db:seed
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```
Open `http://localhost:3000/` on your browser.

### Run tests

To run tests, run the following command:

```sh
  rspec spec/features
  rspec spec/models
  rspec spec/requests
```

To generate the API documentation:
```sh
  rake rswag
```
[API documentation](http://localhost:3000/api-docs/index.html) address.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Author <a name="author"></a>

👤 **Elson Otake**

- GitHub: [elsonotake](https://github.com/elsonotake)
- X: [@elsonotake](https://x.com/elsonotake)
- LinkedIn: [elsonotake](https://linkedin.com/in/elsonotake)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Create admin user to assess general data**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank:

- [Microverse](https://www.microverse.org/)
- [W3Schools](https://www.w3schools.com/)
- [Stack Overflow](https://stackoverflow.com/)
- [Helpjuice](https://helpjuice.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
