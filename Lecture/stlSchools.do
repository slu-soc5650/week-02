// ==========================================================================

// Week-02 Lecture Examples

// ==========================================================================

// define project name

local projName "stlSchools"

// ==========================================================================

// standard opening options

log close _all
graph drop _all
clear all
set more off
set linesize 80

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// construct directory structure for tabular data

capture mkdir "CodeArchive"
capture mkdir "DataClean"
capture mkdir "DataRaw"
capture mkdir "LogFile"
capture mkdir "Output"

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

// create permanent text-based log file
log using "LogFile/`projName'.txt", replace text name(permLog)

// create temporary smcl log file for MarkDoc
quietly log using "LogFile/`projName'.smcl", replace smcl name(tempLog)

// ==========================================================================
// ==========================================================================
// ==========================================================================

/***
# Introduction to Basic Descriptive Commands
#### SOC 4650/5650: Intro to GIS
#### Kyle Miller
#### 27 January 2017

### Description
This do-file introduces the basic commands for data exploration.

### Dependencies
This do-file was written and executed using Stata 14.2.

It also uses the latest [MarkDoc](https://github.com/haghish/markdoc/wiki)
package via GitHub as well as the latest versions of its dependencies:
***/

version 14
which markdoc
which weave
which statax

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/***
### Import/Open Data
***/

local rawData "STL_EDU_Public.csv"

import delimited `rawData', varnames(1)

/*** The import delimited command loads data contained within a .csv file.
In Stata, words after a comma are called options. The option varnames 
dictates the row in which the variable names can be found in the 
`.csv` file. Here, variable names are located in the first row. ***/

describe

/*** The describe command details information about all the variables in the 
  data set. It provides the type of variable as well as the variables' labels.
  */

describe name type

/*** By adding variable names after the describe command, the output is limited 
to information on those vairables. ***/

tabulate type

/*** The tabulate command creates a frequency table of type of school including 
its frequency and the proportion of that type as a percent of all St. Louis 
public school. ***/

summarize gradelow

/*** The summarize command puts forth basic descriptive statistics on the 
vairable including the number of observations, mean, and standard
deviation. ***/

list type gradelow gradehigh in 1/10

/*** The list command displays the specified variables for all observations. 
When used in conjunction with "in" the output of the list command is 
limited to the given range of observations. ***/

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/***
### Save and Export Clean Data
***/

save "DataClean/`projName'.dta", replace
export delimited "DataClean/`projName'.csv", replace

// ==========================================================================
// ==========================================================================
// ==========================================================================

// end MarkDoc log

/*
quietly log close tempLog
*/

// convert MarkDoc log to Markdown

markdoc "LogFile/`projName'", replace export(md)
copy "LogFile/`projName'.md" "Output/`projName'.md", replace
shell rm -R "LogFile/`projName'.md"
shell rm -R "LogFile/`projName'.smcl"

// ==========================================================================

// archive code and raw data

copy "`projName'.do" "CodeArchive/`projName'.do", replace
copy "`rawData'" "DataRaw/`rawData'", replace

// ==========================================================================

// standard closing options

log close _all
graph drop _all
set more on

// ==========================================================================

exit
