library(tidyverse)
library(plotly)
library(tibble)


Place <- c("Hunts Point", "Parkchester/Van Nest", "Morris Park", "Co-op City")
Existing_Total_Jobs_60_Mins <- c(2928628, 2141569, 1056275, 617632)
Penn_Station_Access_Total_Jobs_60_Mins <- c(3220254, 3225149, 2411598, 2292230)

df <- data.frame(Place, Existing_Total_Jobs_60_Mins, Penn_Station_Access_Total_Jobs_60_Mins)

fig <- plot_ly(df, 
               x= ~Place, 
               y= ~Existing_Total_Jobs_60_Mins, 
               type = "bar", 
               name = "Existing Condition", 
               marker = list(color = "#6dccda", showticklabels=TRUE))
fig <- fig %>% add_trace(df,
                         x=~Place,
                         y=~Penn_Station_Access_Total_Jobs_60_Mins,
                         type = "bar",
                         name = "Penn Station Access",
                         marker = list(color = "#cdcc5d", showticklabels=TRUE))
fig <- fig %>% layout(yaxis = list(title = "Total Jobs within 60 Mins"))
fig <- fig %>% layout(xaxis = list(title = ""))
fig <- fig %>% layout(title = "Jobs Within 60 Minutes of Walking and Transit")
fig <- fig %>% config(displayModeBar = F)
fig <- fig %>% layout(margin = list(b=160), 
                      annotations=list(x=1, y=-0.2, 
                                       text= "Note: Assumptions defined by DCP based on OpenTripPlanner and GTFS data", 
                                       showarrow=F, 
                                       xref="paper", 
                                       yref="paper",
                                       xanchor="right", 
                                       yanchor="top", 
                                       xshift=0, 
                                       yshift=0, 
                                       font=list(size=12, 
                                                 color="grey")))

fig

