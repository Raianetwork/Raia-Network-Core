RAIA Network integration/staging tree
=====================================

https://raianetwork.xyz

To see how to run RAIA, please read the respective files in [the doc folder](doc)

Specs
-----
* Name - RAIA Network
* Symbol - RAIA
* Algo - Kawpow
* Supply - 21 billion
* Block Time - 60 seconds
* Block Reward - 5000 RAIA
* Halving - 0.003% every block
* Premine - 0

License
-------

RAIA Network is released under the terms of the MIT license. See [COPYING](COPYING) for more
information or see https://opensource.org/licenses/MIT.

Development Process
-------------------

The `master` branch is regularly built and tested, but is not guaranteed to be
completely stable. [Tags](https://github.com/Raianetwork/Raia-Network-core/tags) are created
regularly to indicate new official, stable release versions of RAIA Network.

Active development is done in branches, branches are created for specific versions. Development for RAIA uses the following workflow:

* Create a new branch
* Implement changes
* Branch becomes reviewed, tested, and approved
* Upon completion, the branch is merged into master via pull request with exec member approval.
  

The contribution workflow is described in [CONTRIBUTING.md](CONTRIBUTING.md).

Please join us on discord for questions or concerns.

Testing
-------

Testing and code review is the bottleneck for development; we get more pull
requests than we can review and test on short notice. Please be patient and help out by testing
other people's pull requests, and remember this is a security-critical project where any mistake might cost people
lots of money.

Testnet is up and running and available to use during development.

### Automated Testing

Developers are strongly encouraged to write [unit tests](src/test/README.md) for new code, and to
submit new unit tests for old code. Unit tests can be compiled and run
(assuming they weren't disabled in configure) with: `make check`. Further details on running
and extending unit tests can be found in [/src/test/README.md](/src/test/README.md).

There are also [regression and integration tests](/test), written
in Python, that are run automatically on the build server.
These tests can be run (if the [test dependencies](/test) are installed) with: `test/functional/test_runner.py`


### Manual Quality Assurance (QA) Testing

Changes should be tested by somebody other than the developer who wrote the
code. This is especially important for large or high-risk changes. It is useful
to add a test plan to the pull request description if testing the changes is
not straightforward.


About RAIA Network
----------------
Powering the future of AI, together.



Raia Network is on a mission to democratize access to Artificial Intelligence (AI) resources and accelerate innovation within the field. We envision a future where anyone, regardless of their technical expertise or resource limitations, can contribute to the advancement of AI.


Abstract
----------------
Raia Network is a Layer 1 blockchain protocol specifically designed to democratize access to Artificial Intelligence (AI) resources. It achieves this by creating a decentralized marketplace for compute power. Users can contribute their idle processing power from personal computers or dedicated servers to a shared pool. This pool acts as a vast, on-demand computing resource that facilitates the training of complex machine learning models at significantly faster speeds and lower costs compared to traditional methods.

In return for contributing their processing power, users are rewarded with RAIA, the native token of the Raia Network. RAIA incentivizes participation and fosters a sustainable ecosystem.  Furthermore, Raia Network empowers developers and data scientists by enabling the tokenization of their machine learning models. This innovative feature allows them to monetize their expertise and creations within the Raia Network marketplace. By facilitating collaboration and resource sharing, Raia Network fosters a vibrant AI community that accelerates innovation and makes cutting-edge AI technology accessible to a wider audience.
