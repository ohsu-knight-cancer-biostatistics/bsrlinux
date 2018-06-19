Rstudio Server on bsrlinux
================
Jessica Minnier
2018-06-19

Managing Packages
=================

To see the directories where R looks for packages:

``` r
.libPaths()
```

    ## [1] "/Users/minnier/Rlib"                                           
    ## [2] "/Library/Frameworks/R.framework/Versions/3.5/Resources/library"

If your home directory (i.e. /home/users/YOURNAME/Rlib) is not included in this output, you either should

-   change your .Rprofile to include this code (RECOMMENDED),
-   or include this code at the top of all scripts (not recommended)

``` r
lib <- .libPaths()
.libPaths(c(lib,"~/Rlib")) # if you want R to look in other folders before your local library

# or:
```

``` r
lib <- .libPaths()
.libPaths(c("~/Rlib",lib)) # if you want R to look in your local library first
```

Now, it should be there:

``` r
.libPaths()
```

    ## [1] "/Users/minnier/Rlib"                                           
    ## [2] "/Library/Frameworks/R.framework/Versions/3.5/Resources/library"

To change your .Rprofile, see bsrlinux\_instructions.txt To install a package, i.e devtools, in your home directory:

``` r
install.packages("devtools",lib="~/Rlib")
library(devtools) # should find it in ~/Rlib
library(devtools,lib.loc = "~/Rlib") # if it is installed in multiple places and you want to force it to look in a certain local library folder
```

For bioconductor, you need to install Bioconductor Installer first:

``` r
source("https://bioconductor.org/biocLite.R")
biocLite("BiocInstaller",lib="~/Rlib",lib.loc="~/Rlib")
```

Then, you can install bioconductor packages (i.e. edgeR) like so:

``` r
source("https://bioconductor.org/biocLite.R")
biocLite("edgeR",lib="~/Rlib",lib.loc="~/Rlib")
```

To install from github, you need devtools and withr packages installed

``` r
withr::with_libpaths("~/Rlib",devtools::install_github("jminnier/jmmisc"))
```

You can view packages that are installed, and where:

``` r
ip <- installed.packages()
View(ip)
```

Tips:
=====

-   use Rstudio projects! Create a project using Rstudio in a folder in your home directory and open the project again using the Rstudio open project commands
-   Turn off auto-saving RData (Tools -&gt; Global Options -&gt; Save Workspace to .RData on exit = NEVER)
-   Restart R Session often
