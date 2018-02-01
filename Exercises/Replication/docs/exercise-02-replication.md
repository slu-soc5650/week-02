Lecture Prep 02 Notebook
================
Christopher Prener, Ph.D.
(January 31, 2018)

Introduction
------------

This is my first R Notebook!

Project Set Up
--------------

``` r
knitr::opts_knit$set(root.dir = here::here())
```

Load Dependencies
-----------------

The following code loads the package dependencies for our analysis:

``` r
library(ggplot2) # creating plots
```

Load Data
---------

The following code loads the data package and assigns our data to a data frame in our global environment:

``` r
library(stlData) # data source
leadData <- stlLead
```

Part 1
------

### Question 1

The first question in this assignment asks for a histogram of the `pctElevated` variable.

``` r
ggplot() +
  geom_histogram(leadData, mapping = aes(pctElevated))
```

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.

![](exercise-02-replication_files/figure-markdown_github/lead-plot-01-1.png)

### Question 2

Next, we want to save our plot using the `ggsave()` function:

``` r
ggsave("results/leadHistogram.png")
```

    ## Saving 7 x 5 in image

    ## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
