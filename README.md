<a id="readme-top"></a>


<!-- PROJECT SHIELDS -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
<!-- [![LinkedIn][linkedin-shield]][linkedin-url] -->



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/Pittinic/pulumi-traefik-k8s">
    <img src="images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">pulumi-traefik-k8s</h3>

  <p align="center">
    A demonstration of traefik on kubernetes using pulumi-yaml with a twist.
    <br />
    <br />
    ·
    <a href="https://github.com/Pittinic/pulumi-traefik-k8s/issues/new?labels=bug&template=bug-report---.md">Report Bug</a>
    ·
    <a href="https://github.com/Pittinic/pulumi-traefik-k8s/issues/new?labels=enhancement&template=feature-request---.md">Request Feature</a>
  </p>
</div>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project


[This forum article](https://learnk8s.io/templating-yaml-with-code) showcases **the challenge of templating yaml for kubernetes with real code**.

This project aims to offer a way to address it around a demonstration scenario of:
* deploying a **Traefik reverse-proxy**
* exposing a **WhoAmI service**
* through **Let's-Encrypt-certified HTTPS** communications
* on **Kubernetes**
* using **Pulumi** and a light custom **shell script**.

Several branches offer various degree of complexity in the demonstration:
* [feat/namespace](https://github.com/Pittinic/pulumi-traefik-k8s/tree/feat/namespace) is the simplest one, leading only to the creation of a namespace on Kubernetes.
* [feat/http](https://github.com/Pittinic/pulumi-traefik-k8s/tree/feat/http) is the next level, including Traefik's deployment and exposing WhoAmI over simple http.
* [feat/https](https://github.com/Pittinic/pulumi-traefik-k8s/tree/feat/https) is the last one, upgrading WhoAmI's exposure to https and adding Let's Encrypt automatic certificate generation and refresh.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

[![Pulumi][Pulumi]][Pulumi-url]
[![Kubernetes][Kubernetes]][Kubernetes-url]
[![Traefik][Traefik]][Traefik-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To get a copy up and running, follow these steps.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Prerequisites

* Install [kubernetes](https://kubernetes.io/docs/setup/) on your server (be it a single-pod instance for local dev, a massive cloud cluster or anything in-between).
* Install [pulumi](https://www.pulumi.com/docs/iac/download-install/) on your local environment. Pulumi will use a local kubeconfig if available, but can also be explicitly configured as shown [here](https://www.pulumi.com/registry/packages/kubernetes/installation-configuration/).
* Install [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) to be able to clone the repo in the next step.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


### Installation

1. Clone the repo
   ```sh
   git clone https://github.com/Pittinic/platypod.git
   ```
2. Remove git remote url to avoid accidental pushes to base project
   ```sh
   git remote rm origin
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

We will create a [Pulumi stack](https://www.pulumi.com/docs/iac/concepts/stacks/) to create an isolated and configurated instance of a deployment.
1. Create a folder named ***src/<stack-name>***.
2. Customize the variables defined in ***src/base/values/\*.yaml*** however you'd like.
    - Either in a single file or several.
    - Filenames do not matter, only their extension (.yml or .yaml).
    - Whatever you do not redefine will keep its default value.
3. Create an environment variable called `PULUMI_CONFIG_PASSPHRASE` to store your pulumi passphrase.
4. Create your stack by running:
    ```sh
    pulumi stack init <stack-name> [--non-interactive]
    ```
 5. Update your stack by running:
    ```sh
    pulumi up --stack=<stack-name> [--non-interactive --skip-preview]
    ```
    Note that you can refine this step, for instance by adding a commit message to the operation. See [pulumi up](https://www.pulumi.com/docs/iac/cli/commands/pulumi_up/)'s documentation.
 6. Delete the stack to decommission it with:
    ```sh
    pulumi destroy stack=<stack-name>  [--non-interactive --yes]
    pulumi stack rm <stack-name> [--yes]
    ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ROADMAP -->
## Roadmap

None for now; one could be made at some point based on feedback from contributors or personal use in other projects.

See the [open issues](https://github.com/Pittinic/pulumi-traefik-k8s/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTRIBUTING -->
## Contributing

Simple feedback will always be welcomed.

Issues can be opened, either to report trouble or suggest enhancements, and will be gladly received.

And of course, code contributions can be done as follows:
1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Top contributors:

<a href="https://github.com/Pittinic/pulumi-traefik-k8s/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Pittinic/pulumi-traefik-k8s" alt="contrib.rocks image" />
</a>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- CONTACT -->
## Contact

Project Link: [https://github.com/Pittinic/pulumi-traefik-k8s](https://github.com/Pittinic/pulumi-traefik-k8s)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* []()

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/Pittinic/pulumi-traefik-k8s.svg?style=for-the-badge
[contributors-url]: https://github.com/Pittinic/pulumi-traefik-k8s/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/Pittinic/pulumi-traefik-k8s.svg?style=for-the-badge
[forks-url]: https://github.com/Pittinic/pulumi-traefik-k8s/network/members
[stars-shield]: https://img.shields.io/github/stars/Pittinic/pulumi-traefik-k8s.svg?style=for-the-badge
[stars-url]: https://github.com/Pittinic/pulumi-traefik-k8s/stargazers
[issues-shield]: https://img.shields.io/github/issues/Pittinic/pulumi-traefik-k8s.svg?style=for-the-badge
[issues-url]: https://github.com/Pittinic/pulumi-traefik-k8s/issues
[license-shield]: https://img.shields.io/github/license/Pittinic/pulumi-traefik-k8s.svg?style=for-the-badge
[license-url]: https://github.com/Pittinic/pulumi-traefik-k8s/blob/master/LICENSE.txt
[Pulumi]: https://img.shields.io/badge/pulumi-%238A3391?style=for-the-badge&logo=pulumi
[Pulumi-url]: https://www.pulumi.com/
[Kubernetes]: https://img.shields.io/badge/kubernetes-%23326CE5?style=for-the-badge&logo=kubernetes&logoColor=FFFFFF
[Kubernetes-url]: https://kubernetes.io/
[Traefik]: https://img.shields.io/badge/traefik-%2324A1C1?style=for-the-badge&logo=traefikproxy&logoColor=FFFFFF
[Traefik-url]: https://doc.traefik.io/traefik/