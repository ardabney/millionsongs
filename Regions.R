# Isolate regions

# Africa
region <- character(nrow(dta))
Africa <- with(dta, (-25.4167 <= ArtistLongitude & 63.5 >= ArtistLongitude) &
  (-34.85417 <= ArtistLatitude & 37.533 >= ArtistLatitude) &
  (36.6904 != ArtistLatitude & -6.13487 != ArtistLongitude) &
    (37.51146 != ArtistLatitude & 15.06744 != ArtistLongitude) &
    (36.71832 != ArtistLatitude & -4.42016 != ArtistLongitude)
    )

# United States
UnitedStates <- with(dta, (-124.7667<=ArtistLongitude & -66.95>=ArtistLongitude) &
  24.520833<=ArtistLatitude & 49.3844722>=ArtistLatitude &
  !((-80<=ArtistLongitude & -71>=ArtistLongitude) & (42<=ArtistLatitude & 47>=ArtistLatitude)))

# Northern America
NorthernAmerica <- with(dta, (-141.184<=ArtistLongitude & -11.48944>=ArtistLongitude) &
  49.13<=ArtistLatitude & 83.667>=ArtistLatitude)

# Central America
# CentralAmerica <- with(dta, ())

# South America
SouthAmerica <- with(dta, (-109.455<=ArtistLongitude & -26.268611>=ArtistLongitude) &
  -59.489<=ArtistLatitude & 13.400833>=ArtistLatitude)

# Europe excluding UK
Europe <- with(dta, (-31.275 <= ArtistLongitude & 69.033 >= ArtistLongitude) &
  (34.80056 <= ArtistLatitude & 81.80667 >= ArtistLatitude) &
  !((-13.6833 <= ArtistLongitude & 1.7667 >= ArtistLongitude) &
  (49.85 <= ArtistLatitude & 60.85 >= ArtistLatitude)))

# United Kingdom
UnitedKingdom <- with(dta, (-13.6833<=ArtistLongitude & 1.7667>=ArtistLongitude) &
  49.85<=ArtistLatitude & 60.85>=ArtistLatitude)

# Russia
Russia <- with(dta, (31.48<=ArtistLongitude & 190.64>=ArtistLongitude) &
  (41.22056<=ArtistLatitude & 81.8430556>=ArtistLatitude) &
  (49.08215 != ArtistLatitude & 33.43009 != ArtistLongitude))

# Asia
Asia <- with(dta, (35.143<=ArtistLongitude & 142.02>=ArtistLongitude) &
  (-9.277<=ArtistLatitude & 54.174>=ArtistLatitude) &
  (33.89275 != ArtistLatitude & 35.48527 != ArtistLongitude))

# Australia
Australia <- with(dta, (113.15<=ArtistLongitude & 178.686>=ArtistLongitude) &
  -55.05<=ArtistLatitude & -9.139722>=ArtistLatitude)

region[Africa == TRUE] <- "Africa"
Africa[is.na(Africa)] <- FALSE
Africa_dta <- dta[Africa, ]
Africa_dta$region <- "Africa"
Africa_dta$region_new <- "Other"

region[UnitedStates == TRUE] <- "UnitedStates"
UnitedStates[is.na(UnitedStates)] <- FALSE
UnitedStates_dta <- dta[UnitedStates, ]
UnitedStates_dta$region <- "UnitedStates"
UnitedStates_dta$region_new <- "UnitedStates"

region[NorthernAmerica == TRUE] <- "NorthernAmerica"
NorthernAmerica[is.na(NorthernAmerica)] <- FALSE
NorthernAmerica_dta <- dta[NorthernAmerica, ]
NorthernAmerica_dta$region <- "NorthernAmerica"
NorthernAmerica_dta$region_new <- "NorthernAmerica"

region[SouthAmerica == TRUE] <- "SouthAmerica"
SouthAmerica[is.na(SouthAmerica)] <- FALSE
SouthAmerica_dta <- dta[SouthAmerica, ]
SouthAmerica_dta$region <- "SouthAmerica"
SouthAmerica_dta$region_new <- "Other"

region[Europe == TRUE] <- "Europe"
Europe[is.na(Europe)] <- FALSE
Europe_dta <- dta[Europe, ]
Europe_dta$region <- "Europe"
Europe_dta$region_new <- "Europe"

region[UnitedKingdom == TRUE] <- "UnitedKingdom"
UnitedKingdom[is.na(UnitedKingdom)] <- FALSE
UnitedKingdom_dta <- dta[UnitedKingdom, ]
UnitedKingdom_dta$region <- "UnitedKingdom"
UnitedKingdom_dta$region_new <- "UnitedKingdom"

region[Russia == TRUE] <- "Russia"
Russia[is.na(Russia)] <- FALSE
Russia_dta <- dta[Russia, ]
Russia_dta$region <- "Russia"
Russia_dta$region_new <- "Other"

region[Asia == TRUE] <- "Asia"
Asia[is.na(Asia)] <- FALSE
Asia_dta <- dta[Asia, ]
Asia_dta$region <- "Asia"
Asia_dta$region_new <- "Other"

region[Australia == TRUE] <- "Australia"
Australia[is.na(Australia)] <- FALSE
Australia_dta <- dta[Australia, ]
Australia_dta$region <- "Australia"
Australia_dta$region_new <- "Other"

# Alternative grouping
# Groups western regions v. every other region
# Must to do this to run qda classifier (some regions don't have enough songs)
region_new <- rep("Other",nrow(dta))
region_new[region == "UnitedStates"] <- "UnitedStates"
region_new[region == "UnitedKingdom"] <- "UnitedKingdom"
region_new[region == "NorthernAmerica"] <- "NorthernAmerica"
region_new[region == "Europe"] <- "Europe"
region_new[region == "Other"] <- "Other"



# rbind
region_dta <- rbind(Africa_dta, UnitedStates_dta, SouthAmerica_dta, Europe_dta,
  UnitedKingdom_dta, Russia_dta, Asia_dta, Australia_dta)
vars_selected <- c("Duration", "KeySignature", "Tempo", "TimeSignature",
    "Year", "StartFadeOut", "EndFadeIn")
region_dta_selected <- region_dta[, c("region", vars_selected)]
region_new_selected <- region_dta[, c("region_new", vars_selected)]


# Retain only numerical predictor variables.
# dta_Region <- with(region_dta, region_dta[, c(Danceability, Duration, KeySignature,
#  Tempo, TimeSignature, Year,
#  StartFadeOut, EndFadeIn)])
