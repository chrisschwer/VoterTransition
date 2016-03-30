wanderungAbsolut <- function (ergebnisAlt, wanderung) {
  
  # Berechnet die absolute Wanderung basierend auf der Wählerwanderungsmatrix
  # und den alten Ergebnissen
  # ergebnisAlt : m*n Matrix der absoluten Wahlergebnisse in der ersten Wahl
  # wanderung : n*p Matrix der relativen Wählerwanderungen
  
  ergebnisAltSumme <- colSums (ergebnisAlt)
  
  return (ergebnisAltSumme * wanderung)
}