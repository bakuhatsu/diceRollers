#################################
# 10/12/2016                    #
# Sven Nelson                   #
# diceRoll gui (shinyGadget)    #
#################################


require(shiny)
require(miniUI)
require(shinythemes)

diceRollGUI <- function(numOfDice, sides=6) {

  ui <- miniUI::miniPage(
    #shinythemes::themeSelector(), # spacelab was good
    theme = shinythemes::shinytheme("spacelab"),
    miniUI::gadgetTitleBar("Roll the dice!"),
    miniUI::miniTabstripPanel(
      miniUI::miniTabPanel("Dice roller", icon = shiny::icon("glyphicon glyphicon-retweet", lib = "glyphicon"),
                   miniUI::miniContentPanel(
                     shiny::textInput("numDice", label = "Number of dice?", value = 2),
                     #textInput("diceSides", label = "How many sides per die?", placeholder = "6", value = 6),
                     shiny::sliderInput("diceSides", label = "How many sides per die?",
                                 min=2, max=20, value=6, step = 1),
                     miniUI::miniButtonBlock(shiny::actionButton("go", label = "Roll!", icon = shiny::icon("glyphicon glyphicon-retweet", lib = "glyphicon"))), # , actionButton("settings", label = "Hit settings", icon = icon("gears"))
                     #br(),
                     shiny::textOutput("roll", container = htmltools::pre)
                   )
      ),
      miniUI::miniTabPanel("Hit parameters", icon = shiny::icon("sliders"),
                   miniUI::miniContentPanel(
                     htmltools::h4("Hit minimum:"),
                     shiny::uiOutput("minHitSlider"),
                     htmltools::h4("Doubles on:"),
                     shiny::uiOutput("selectDoubles")
                   )
      )
    )
  )

  server <- function(input, output, session) {
    output$selectDoubles <- shiny::renderUI({
      possDbl <- input$minHit:input$diceSides
      shiny::checkboxGroupInput("dblsOn", NULL, possDbl, inline = T) # selected = 6,
    })
    #output$diceSides <- input$diceSides
    output$minHitSlider <- shiny::renderUI({
      shiny::sliderInput("minHit", label = NULL, min = 1, max = input$diceSides, value = 4, sep = "", step = 1)
    })

    my_text <- shiny::reactive({
      if (input$go == 0) {
        return()
      }
      shiny::isolate({
        input$go
        #print(as.numeric(input$dblsOn)) # code for testing
        diceRollers::diceRoll(input$numDice, input$diceSides, hitLow = input$minHit, double = as.numeric(input$dblsOn))
      })
    })
    output$roll <- shiny::renderPrint({
      my_text()
    })

    shiny::observeEvent(input$done, {
      shiny::stopApp(NULL)
    })
  }

  shiny::runGadget(ui, server, viewer = shiny::dialogViewer("Dice Roll", width = 200, height = 405))
}
