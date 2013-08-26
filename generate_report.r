



# Strings ain't factors
options(stringsAsFactors = FALSE)


# Load knitr and markdown to generate the report
library(knitr)
library(markdown)


# Temp quarter label
qtr_label <- "2013 Q2"


# Loop over each county (or collection of counties)
counties <- list(
    data.frame(label = "Denver County",
               county = "Denver"),
    data.frame(label = "Boulder County",
               county= "Boulder"),
    data.frame(label = "Broomfield County",
               county= "Broomfield"),
    data.frame(label = "Jefferson County",
               county= "Jefferson"),
    data.frame(label = "Tri-County Health Department",
               county= c("Adams", "Arapahoe", "Douglas"))
)


# Loop over the counties
lapply(counties, function(x) {


    mdfile <- file.path("temp", "county_report.md")

    htmlfile <- file.path("reports", 
                          paste(x$label[1], 
                                " ",
                                qtr_label, 
                                ".html",
                                sep = "")
    )



    # Knit it
    knit("county_report.rmd", 
         output = mdfile)

    # Convert to HTML
    markdownToHTML(file = mdfile,
                   output = htmlfile,
                   stylesheet = file.path("..", "css", "tb_report.css"))


})
