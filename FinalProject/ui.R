library(shiny)
library(datasets)
data(swiss)
shinyUI(pageWithSidebar(
      headerPanel("Data Science Final Project"),
      sidebarPanel(
            h3('User Data Exploration'),
            p('Please create a Linear Model from the swiss data set using',
              'Examination as the dependent variable and selecting the appropriate',
              'prdictors.'),
            checkboxGroupInput("id1","Predictors",
                               c("Agriculture" = "Agriculture",
                                 "Catholic" = "Catholic",
                                 "Education" = "Education",
                                 "Fertility" = "Fertility",
                                 "Infant Mortality" = "Infant.Mortality")),
            submitButton("Submit"),
            p("Please note that this simple project is not designed to explore",
              "the full complexity of this dataset.")
      ),
      mainPanel(
            h3('Model Summary'),
            verbatimTextOutput("Ans")
      )
))