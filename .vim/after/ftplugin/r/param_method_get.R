## path <- <package path>
args <- commandArgs(T)
if (length(args) == 0)
  stop( "no args found" )
suppressMessages(devtools::load_all(".", quiet = T))
args <- formalArgs(match.fun(args[1]))
obj <- lapply(args,
              function(arg){
                cat("#' @param ", arg, " ...\n", sep = "")
              })
