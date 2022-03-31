header <- function() {
	 dashboardHeader(
	 	 title = tagList(
	 	 	 span(class = 'logo-lg',a("Graveler",style="color:white !important",href='https://www.rstudio.com/products/connect/')),
	 	 	 a(style = "margin: -15px", href='https://www.rstudio.com/products/connect/', img(src = "www/graveler_sprite.svg", width="225%"))
	 	 ),
	 	 controlbarIcon = "gear",
	 	 disable = FALSE
	 )
}
