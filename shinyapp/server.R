library(shiny)
library(rattle)  # needed for the wine dataset
library(tree)
library(randomForest)
library(e1071)
data(wine)

dataset <- wine
oLabel <- "Type"
outcome <- dataset[,oLabel]

shinyServer(function(input, output) {
  
  # Select user specified columns.
  subdata <- reactive({
    subset(dataset, select=c(input$x, input$y))
  })
  
  # Make classification by using user specified model.
  cluster <- reactive({
    # build up formula
    f <- as.formula(
      sprintf("%s ~ %s + %s", oLabel, input$x, input$y)
    )
    # set random seed
    set.seed(17171)
    # create model and return the predict
    if (input$model == "Naive Bayes"){
      m <- naiveBayes(f, data=dataset)
      predict(m, subdata(), type="class")
    } else if (input$model == "Random Forest") {
      m <- randomForest(f, data=dataset)
      predict(m, subdata(), type="response")
    } else if (input$model == "Regression Tree") {
      m <- tree(f, data=dataset)
      predict(m, subdata(), type="class")
    }
  })

  # Calculate miss classification ratio
  missClass <- reactive({
    sum(cluster() != outcome) / length(outcome)
  })

  # Plot figures
  output$plot <- renderPlot({
    par(mfrow=c(1, 2))
    # Colored by actual types
    plot(subdata(), col=as.integer(outcome)+1,
         pch=20, cex=1.8, main="Actual Types")
    # Colored by predicted types
    plot(subdata(), col=as.integer(cluster())+1,
         pch=20, cex=1.8, main="Predicted Types")
  })

  # Print the specified model name and miss classification ratio
  output$status <- renderText({
#     p(sprintf("Model=%s", input$model)), br(), p(sprintf("Model=%s", input$model))
    sprintf("Model=%s, Miss Classification (Internal Error) Ratio=%.2f",
            input$model, missClass())
  })
})