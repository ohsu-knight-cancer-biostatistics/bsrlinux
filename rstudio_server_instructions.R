#'---
#'title: "Rstudio Server on bsrlinux"
#'author: "Jessica Minnier"
#'date: '`r Sys.Date()`'
#'output: github_document
#'---


#' # Managing Packages
#' 

#' To see the directories where R looks for packages:
.libPaths()

#' If your home directory (i.e. /home/users/YOURNAME/Rlib) is not included in this output,
#' you either should
#' 
#' - change your .Rprofile to include this code (RECOMMENDED), 
#' - or include this code at the top of all scripts (not recommended)
lib <- .libPaths()
.libPaths(c(lib,"~/Rlib")) # if you want R to look in other folders before your local library

# or:
#+ eval=FALSE
lib <- .libPaths()
.libPaths(c("~/Rlib",lib)) # if you want R to look in your local library first

#' To change your .Rprofile, see [bsrlinux_instructions.txt](bsrlinux_instructions.txt). Or, you can try using the 
#' usethis package:
#+ eval=FALSE
install.packages("usethis",lib="~/Rlib")
usethis::edit_r_profile() # copy and paste above code into the file that opened, and save
#' 
#' Now, it should be there every time you open a new R session:
#' 
.libPaths()

#' To install a package, i.e devtools, in your home directory:
#+ eval=FALSE
install.packages("devtools",lib="~/Rlib")
library(devtools) # should find it in ~/Rlib
library(devtools,lib.loc = "~/Rlib") # if it is installed in multiple places and you want to force it to look in a certain local library folder

#' For bioconductor, you need to install Bioconductor Installer first:
#+ eval=FALSE
source("https://bioconductor.org/biocLite.R")
biocLite("BiocInstaller",lib="~/Rlib",lib.loc="~/Rlib")

#' Then, you can install bioconductor packages (i.e. edgeR) like so:
#+ eval=FALSE
source("https://bioconductor.org/biocLite.R")
biocLite("edgeR",lib="~/Rlib",lib.loc="~/Rlib")

#' To install from github, you need devtools and withr packages installed
#+ eval=FALSE
withr::with_libpaths("~/Rlib",devtools::install_github("jminnier/jmmisc"))

#' You can view packages that are installed, and where:
#+ eval=FALSE
ip <- installed.packages()
View(ip)

#' # Tips:
#' 
#' - Use Rstudio projects! Create a project using Rstudio in a folder in your home directory
#' and open the project again using the Rstudio open project commands
#' - Turn off auto-saving RData (Tools -> Global Options -> Save Workspace to .RData on exit = NEVER)
#' - Restart R Session often
#' - To add github ssh keys, follow instructions for unix: http://happygitwithr.com/ssh-keys.html
#' - For an intro on how to use exacloud, see Ted Laderas' [Exacloud Tutorial materials](https://github.com/laderast/exacloud_tutorial) and the 
#' ACC's [Exacloud Guide](https://accdoc.ohsu.edu/exacloud/guide/)
