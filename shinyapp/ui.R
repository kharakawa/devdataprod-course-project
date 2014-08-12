library(shiny)
library(rattle)  # needed for the wine dataset

data(wine)

dataset <- wine
predictorNames <- names(dataset)[-1]

shinyUI(fluidPage(
  
  # Title
  h1("Wine Type Classification Demo", align="center"),

  # Documentation
  fluidRow(column(10, offset=1,  
    helpText("This application demonstrates three different classification methods on the ",
             a("Wine Dataset", href="http://archive.ics.uci.edu/ml/datasets/Wine"),
             ".",
             "You can select arbitrary two predictors (X and Y) and a classification model on the left pane.",
             "Then, on the server side, a model is trained and predictions on the training data are made by using the model.",
             "The right pane shows comparison plots of actual types and predicted types, ",
             "as well as the training set miss classification ratio of the model.",
             "You will notice that random forest generally achieves higher fit to the training data (i.e. smaller miss classification ratio).")
  )),
  
  # Contents
  fluidRow(
    # Sidebar
    column(4, wellPanel(
      
      selectInput('x', 'X', predictorNames),
      selectInput('y', 'Y', predictorNames, selected=predictorNames[3]),
      radioButtons('model', 'Model:',
                   c("Naive Bayes",
                     "Random Forest",
                     "Regression Tree")),
      shiny::hr(),
      helpText('Note: Although each change becomes effective immediately, it may take time for a while until the plots are updated.')
    )),
    
    # Main
    mainPanel(
      tags$head(tags$style("#status {font-size:large}")),
      textOutput('status'),
      plotOutput('plot'),
      width=8
    )
    
  )
))