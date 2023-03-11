mc2 <- 
  function(){
    devtools::load_all("~/MCnebula2")
  }
mc2()
devtools::load_all("~/initializeR")
devtools::load_all("~/sinew/")
gf <- sinew::makeOxygen
