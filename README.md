<p align="center"><img src="https://raw.githubusercontent.com/opensourcepos/opensourcepos/master/branding/emblem.svg" alt="SuperMaket.CI Sale Logo" width="auto" height="200"></p>
<h3 align="center">SuperMaket.CI Sale</h3>

<p align="center">
  <a href="#-introduction">Introduction</a> · <a href="#-live-demo">Demo</a> · <a href="#-installation">Installation</a> · 
  <a href="#-contributing">Contributing</a> · <a href="#-reporting-bugs">Bugs</a> · <a href="#-faq">FAQ</a> · 
   · <a href="#-license">License</a> · <a href="#-credits">Credits</a>
</p>

<!-- <p align="center">
<a href="https://github.com/opensourcepos/opensourcepos/actions/workflows/build-release.yml" target="_blank"><img src="https://github.com/opensourcepos/opensourcepos/actions/workflows/build-release.yml/badge.svg" alt="Build Status"></a>
<a href="https://app.gitter.im/#/room/#opensourcepos_Lobby:gitter.im?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge" target="_blank"><img src="https://badges.gitter.im/jekkos/opensourcepos.svg" alt="Join the chat at https://app.gitter.im"></a>
<a href="https://badge.fury.io/gh/opensourcepos%2Fopensourcepos" target="_blank"><img src="https://badge.fury.io/gh/opensourcepos%2Fopensourcepos.svg" alt="Project Version"></a>
<a href="https://translate.opensourcepos.org/engage/opensourcepos/?utm_source=widget" target="_blank"><img src="https://translate.opensourcepos.org/widgets/opensourcepos/-/svg-badge.svg" alt="Translation Status"></a>
</p> -->

## 👋 Introduction

SuperMaket.CI Sale is a web-based point of sale system. The application is written in PHP, uses MySQL (or MariaDB) as the data storage back-end, and has a simple but intuitive user interface.

The latest `3.4` version is a complete overhaul of the original software. It uses CodeIgniter 4 as a framework and is based on Bootstrap 3 using Bootswatch themes. Along with improved functionality and security.

The features include:

- Stock management (items and kits with an extensible list of attributes)
- VAT, GST, customer, and multi tiers taxation
- Sale register with transactions logging
- Quotation and invoicing
- Expenses logging
- Cash up function
- Printing and emailing of receipts, invoices and quotations
- Barcode generation and printing
- Database of customers and suppliers
- Multiuser with permission control
- Reporting on sales, orders, expenses, inventory status and more
- Receivings
- Gift cards
- Rewards
- Restaurant tables
- Messaging (SMS)
- Multilanguage
- Selectable Bootstrap based UI theme with Bootswatch
- MailChimp integration
- Optional Google reCAPTCHA to protect the login page from brute force attacks
- GDPR ready

## 🧪 Live Demo

We've got a live version of our latest master running for you to play around with and test everything out. It's a containerized install that will reinitialize when new functionality is merged into our code repository.

You can  log in with these credentials.  
👤 Username `admin`  
🔒 Password `pointofsale`

If you bump into an issue, please check to confirm if the server is up and running.

## 🖥️ Development Demo

Besides the demo of the latest master, we also have a development server that builds when there's a new commit to our repository. It's mainly used for testing out new code before merging it into the master.

The log in credentials are the same as the regular live demo.

## 💾 Installation

Please **refrain from creating issues** about installation problems before having read the FAQ and going through existing GitHub issues. We have a build pipeline that checks the sanity of our latest repository commit, and in case the application itself is broken then our build will be as well.

This application can be set up in _many_ different ways and we only support the ones described in [the INSTALL.md file](docs/INSTALL.md). See also [BUILD.md](docs/BUILD.md) for building from source and [UPGRADE.md](docs/UPGRADE.md) for upgrading existing installations.

For more information and recommendations on support hardware, like receipt printers and barcode scanners, read on our wiki.

## ✨ Contributing

Everyone is more than welcome to help us improve this project. If you think you've got something to help us go forward, feel free to open a [pull request]() or join the conversation on [Element].

Want to help translateSuperMarket.CI in your language? You can find [our Weblate here], sign up, and start translating. You can subscribe to different languages to receive a notification once a new string is added or needs updating. Have a look at our [guidelines] below to help you get started.

Only with the help of the community, we can keep language translations up to date. Thanks!

## 🐛 Reporting Bugs

Before creating a new issue, you'll need copy and include the info under the `System Info` tab in the configuration section in most cases. If that information is not provided in full, your issue might be tagged as pending.

If you're reporting a potential security issue, please refer to our security policy found in the [SECURITY.md](SECURITY.md) file.

NOTE: If you're running non-release code, please make sure you always run the latest database upgrade script and download the latest master code.

## 📖 FAQ

- If you get the message `system folder missing`, then you have cloned the source using git and you need to run a build first. Check [INSTALL.md](docs/INSTALL.md) for instructions or download latest zip file from [GitHub releases] instead.

- If at login time you read `The installation is not correct, check your php.ini file.`, please check the error_log in `public` folder to understand what's wrong and make sure you read the [INSTALL.md](docs/INSTALL.md). To know how to enable `error_log`, please read the comment in [issue #1770]

- If you installed your OSPOS under a web server subdir, please edit `public/.htaccess` and go to the lines with the comments `if in web root` or `if in subdir`, uncomment one and replace `<OSPOS path>` with your path, and follow the instruction on the second comment line. If you face more issues, please read [issue #920] for more information.

- Apache server configurations are SysAdmin issues and not strictly related to OSPOS. Please make sure you can show a "Hello world" HTML page before pointing to OSPOS public directory. Make sure `.htaccess` is correctly configured.

- If the avatar pictures are not shown in items or at item save you get an error, please make sure your `writable` and subdirs are assigned to the correct owner and the access permission is set to `750`.

- If you install OSPOS in Docker behind a proxy that performs `ssloffloading`, you can enable the URL generated to be HTTPS instead of HTTP, by activating the environment variable `FORCE_HTTPS = 1`.

- If you install OSPOS behind a proxy and OSPOS constantly drops your session, consider whitelisting the proxy IP address by setting `public array $proxyIPs = [];` in the [main PHP config file].

- If you have suhosin installed and face an issue with CSRF, please make sure you read [issue #1492].

- PHP `≥ 8.2` is required to run this app.



## 📄 License

SuperMaket.CI Sale is licensed under MIT terms with an important addition:

The footer signature "© 2026·  " including the version, hash and link to our website MUST BE RETAINED, MUST BE VISIBLE IN EVERY PAGE and CANNOT BE MODIFIED.

Also worth noting:

_The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._

For more details please read the [LICENSE](LICENSE) file.

It's important to understand that although you are free to use the application, the copyright has to stay and the license agreement applies in all cases. Therefore, any actions like:

- Removing LICENSE and/or any license files is prohibited
- Authoring the footer notice replacing it with your own or even worse claiming the copyright is absolutely prohibited
- Claiming full ownership of the code is prohibited

In short, you are free to use the application, but you cannot claim any property on it.

Any person or company found breaching the license agreement might find a bunch of monkeys at the door ready to destroy their servers.

## 🙏 Credits

| <div align="center">DigitalOcean</div> | <div align="center">JetBrains</div> | <div align="center">GitHub</div> |
| --- | --- | --- |
| <div align="center"><a href="https://www.digitalocean.com?utm_medium=opensource&utm_source=opensourcepos" target="_blank"><img src="https://github.com/user-attachments/assets/fbbf7433-ed35-407d-8946-fd03d236d350" alt="DigitalOcean Logo" height="50"></a></div> | <div align="center"><a href="https://www.jetbrains.com/idea/" target="_blank"><img src="https://github.com/opensourcepos/opensourcepos/assets/12870258/187f9bbe-4484-475c-9b58-5e5d5f931f09" alt="IntelliJ IDEA Logo" height="50"></a></div> | <div align="center"><a href="https://github.com/features/actions" target="_blank"><img src="https://github.githubassets.com/images/modules/site/icons/eyebrow-panel/actions-icon.svg" alt="GitHub Actions Logo" height="50"></a></div> |
| Many thanks to [DigitalOcean](https://www.digitalocean.com) for providing the project with hosting credits. | Many thanks to [JetBrains](https://www.jetbrains.com/) for providing a free license of [IntelliJ IDEA](https://www.jetbrains.com/idea/) to kindly support the development of OSPOS. | Many thanks to [GitHub](https://github.com) for providing free continuous integration via GitHub Actions for open-source projects. |
