install.packages("tidyverse")
install.packages("dplyr")

library(dplyr)

newStarWars <- starwars %>% filter(species == "Droid")
#> # A tibble: 6 × 14
#>   name   height  mass hair_color skin_color eye_c…¹ birth…² sex   gender homew…³
#>   <chr>   <int> <dbl> <chr>      <chr>      <chr>     <dbl> <chr> <chr>  <chr>  
#> 1 C-3PO     167    75 <NA>       gold       yellow      112 none  mascu… Tatooi…
#> 2 R2-D2      96    32 <NA>       white, bl… red          33 none  mascu… Naboo  
#> 3 R5-D4      97    32 <NA>       white, red red          NA none  mascu… Tatooi…
#> 4 IG-88     200   140 none       metal      red          15 none  mascu… <NA>   
#> 5 R4-P17     96    NA none       silver, r… red, b…      NA none  femin… <NA>   
#> # … with 1 more row, 4 more variables: species <chr>, films <list>,
#> #   vehicles <list>, starships <list>, and abbreviated variable names
#> #   ¹eye_color, ²birth_year, ³homeworld

starwars %>%select(name, ends_with("color"))
#> # A tibble: 87 × 4
#>   name           hair_color skin_color  eye_color
#>   <chr>          <chr>      <chr>       <chr>    
#> 1 Luke Skywalker blond      fair        blue     
#> 2 C-3PO          <NA>       gold        yellow   
#> 3 R2-D2          <NA>       white, blue red      
#> 4 Darth Vader    none       white       yellow   
#> 5 Leia Organa    brown      light       brown    
#> # … with 82 more rows

starwars %>% 
  mutate(name, bmi = mass / ((height / 100)  ^ 2)) %>%
  select(name:mass, bmi)
#> # A tibble: 87 × 4
#>   name           height  mass   bmi
#>   <chr>           <int> <dbl> <dbl>
#> 1 Luke Skywalker    172    77  26.0
#> 2 C-3PO             167    75  26.9
#> 3 R2-D2              96    32  34.7
#> 4 Darth Vader       202   136  33.3
#> 5 Leia Organa       150    49  21.8
#> # … with 82 more rows

starwars %>% 
  arrange(desc(mass))
#> # A tibble: 87 × 14
#>   name         height  mass hair_…¹ skin_…² eye_c…³ birth…⁴ sex   gender homew…⁵
#>   <chr>         <int> <dbl> <chr>   <chr>   <chr>     <dbl> <chr> <chr>  <chr>  
#> 1 Jabba Desil…    175  1358 <NA>    green-… orange    600   herm… mascu… Nal Hu…
#> 2 Grievous        216   159 none    brown,… green,…    NA   male  mascu… Kalee  
#> 3 IG-88           200   140 none    metal   red        15   none  mascu… <NA>   
#> 4 Darth Vader     202   136 none    white   yellow     41.9 male  mascu… Tatooi…
#> 5 Tarfful         234   136 brown   brown   blue       NA   male  mascu… Kashyy…
#> # … with 82 more rows, 4 more variables: species <chr>, films <list>,
#> #   vehicles <list>, starships <list>, and abbreviated variable names
#> #   ¹hair_color, ²skin_color, ³eye_color, ⁴birth_year, ⁵homeworld

starwars %>%
  group_by(species) %>%
  summarise(
    n = n(),
    mass = mean(mass, na.rm = TRUE)
  ) %>%
  filter(
    n > 1,
    mass > 50
  )
#> # A tibble: 8 × 3
#>   species      n  mass
#>   <chr>    <int> <dbl>
#> 1 Droid        6  69.8
#> 2 Gungan       3  74  
#> 3 Human       35  82.8
#> 4 Kaminoan     2  88  
#> 5 Mirialan     2  53.1
#> # … with 3 more rows
