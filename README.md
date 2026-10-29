# RAlnor

An R package.

## Installation

You can install the development version from GitHub with:

```r
# install.packages("remotes")
remotes::install_github("MikkelAlnor/Ralnor")
```

## Example

```r
library(RAlnor)
hello_ralnor("world")
#> [1] "Hello, world!"

quote()
#> [1] "Fall seven times, stand up eight. - Japanese proverb"

quote(theme = "learning", n = 2)
```

Themes: `"perseverance"`, `"learning"`, `"courage"`, `"action"`

## Contributors

- [MikkelAlnor](https://github.com/MikkelAlnor) — maintainer
- [GLM (Z.ai)](https://github.com/zai-org) — AI assistant, code contributions

## Development

See `WORKFLOW.md` for the devtools-based development workflow, or run
`./install.sh` to install dependencies and the package from a source checkout.
