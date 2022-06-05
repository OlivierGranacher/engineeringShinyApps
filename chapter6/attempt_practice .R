# attempt example
grep("att", search(), value = T) 
installed.packages()
install.packages("attempt")
attempt::try_catch(log("a"),
                   .e =  ~ print(paste("Error :", .x))
)

                   
