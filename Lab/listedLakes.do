// ==========================================================================

// Lab-02 Replication

// ==========================================================================

// define project name

local projName "listedLakes"

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
# Working with Data Using Stata and Atom
#### SOC 4650/5650: Intro to GIS
#### Kyle Miller
#### 27 January 2017

### Description
This Markdown file describes the basic functions of Stata. Having completed 
this students should feel comfortable creating a Markdown file and engaging 
in rudimentary data cleaning.

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

local rawData "MO_HYRDO_ImpairedLakes.csv"

import delimited `rawData', varnames(1)

/*** 
**11a.** The import delimited command loads the .csv file from one's working
directory into Stata. Recall that this command is used specifically for 
.csv files. The varnnames option describes which row Stata should look for 
the names of the variables. In this case, we have indicated the first row. 
***/

describe

/*** 
**11b.** The describe command provides a list of all vairables including their 
names, storage types, and labels. There are thirteen variables classified 
as string. Note that the number after "str" indicate the number of //
characters possible in the field. 
***/

summarize yr

/*** 
**11c.** The summarize command displays descriptive statistics for the 
variable. The average year that a body of water was listed was 2010. The 
earliest a body of water was added was 2002. The latest a body of water was 
added was 2016. Therefore, there is a range of fourteen years. 
***/

table water_body

/*** 
**11d.** The table command creates a table of observations along with their
frequency. We didn't introduce this command in class but it is another
good option to know about. The lake with the most observations is Table 
Rock Lake. 
***/

tabulate source_

/*** 
**11e.** The tabulate command is similar to the table command, but provides 
more information. It details not only the frequency of each source, but 
the proportion of that source in the greater data set. Atmospheric 
Desposition - Toxics is the largest source of pollutants with 67.44% 
***/

list yr water_body pollutant in 1/10

/*** 
**11f.** The list command details each variable for a specified number of 
observations. The first ten observations demonstrate that the pollutants 
affecting the Bowling Green Lake are Chlorophyll-a, Nitrogen, and Phosphorus. 
***/


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
