library(shiny)
library(shinydashboard)



# il faut separer les elements par des virgules
body_exemple <- fluidRow(
  box(title = "Box title", "Box content"),
  box(status = "warning", "Box content")
)

body <- fluidRow(
  box(
    title = "titre", width = 4, solidHeader = TRUE,
    "Box content"
  ),
  box(
    title = "Title 5", width = 4, background = "light-blue",
    "A box with a solid light-blue background"
  )
)


ui <- dashboardPage(skin = "red",
                    dashboardHeader(title="Application Shiny"),
                    # contenu de la barre de navigation
                    dashboardSidebar( 
                      sidebarMenu(
                        menuItem("Accueil", tabName = "accueil", icon = icon("chess")),
                        menuItem("TCL", tabName = "tcl", icon = icon("arrow-right")), # icon th sinon
                        menuItem("Sources", tabName = "sources", icon = icon("file"))
                      )
                    ),
                    # contenu de la page
                    dashboardBody(tags$link(rel = "stylesheet", type = "text/css", href = "style1.css"),
                                  tabItems(
                                    # page accueil
                                    tabItem(tabName = "accueil",body_exemple
                                    ),
                                    
                                    # page tcl
                                    tabItem(tabName = "tcl",
                                            fluidRow(
                                              box(plotOutput("plot1")),
                                              
                                              box(textInput("text", "Text input:"),
                                                  "Box content here", br(), "More box content",
                                                  sliderInput(inputId = "bins",
                                                              label = "number of bins:",
                                                              min=1, max = 50,value = 30),
                                                  radioButtons(inputId="idRadio",label="chose one",selected=2,
                                                               choices=c("histogrammes en densite"=1,
                                                                         "histogrammes en frequences"=2
                                                               ))
                                                  
                                              ))),
                                    
                                    # page sources
                                    tabItem(tabName = "sources",body
                                    )
                                  )
                    )
)