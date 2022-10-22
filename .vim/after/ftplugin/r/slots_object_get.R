## path <- <package path>
args <- commandArgs(T)
if (length(args) == 0)
  stop( "no args found" )
suppressMessages(devtools::load_all(".", quiet = T))
obj <- match.fun(args[1])()
obj <- lapply(slotNames(obj),
       function(name){
         cat("#' @slot ", name, " ...\n", sep = "")
       })
