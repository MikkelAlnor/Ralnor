# Workflow for developing the RAlnor package
#
# Run these from the package root (/work/Alnor/RAlnor) in an R session:

# One-time setup
# install.packages(c("devtools", "roxygen2", "testthat"))

devtools::load_all()        # load package for interactive work
devtools::document()        # generate man/ pages from roxygen comments
devtools::test()            # run testthat tests
devtools::check()           # full R CMD check
devtools::build()           # build tarball
