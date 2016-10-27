# diceRollers
A neat shiny gadget and Rstudio addin for dice rolls.
### Installing and loading the `diceRollers` package:
Installing through GitHub requires the `devtools` package, so instructions for installing and loading that package are provided below.
```r
## Install and load devtools for loading packages from GitHub
install.packages("devtools") # to allow us to install packages from GitHub
library(devtools)
```
Since GitHub packaged are compiled on your machine to run, you may be prompted to "install build tools" or something similar.  Follow the instructions, which will install the tools needed to compile this package.
  
Now you should be ready to install and then load the `diceRollers` package
```r
## Install pacNamesAddin package to get the RStudio addins for automatic insertion of package names
install_github("bakuhatsu/diceRollers") # syntax for installing from GitHub: username/library
library(diceRollers) # To load the package (not necessary to directly use the addin version)
```
Run directly from the command line with:
```r  
iceRollers::diceRollGUI()
``` 
Does not require RStudio.  If run outside of RStudio, will load in the default web browser.  
