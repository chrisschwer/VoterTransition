fehlerberechnung <- function (ergebnisAlt, ergebnisNeu, wanderung) {
  
  # Berechnet den Fehler als Summe der quadrierten Differenzen zwischen
  # dem modellierten Ergebnis und dem tatsächlichen Ergebnis.
  
  # ergebnisAlt : Ausgangswahlergebnis, m * n Matrix für m regionale Einheiten und n Parteien
  # ergebnisNeu : Endwahlergebnis, m * p Matrix für m regionale Einheiten und p Parteien
  # wanderung : Wählerwanderung, n * p Matrix um Wanderung von n auf p Parteien zu modellieren
  
  ergebnisModell <- ergebnisAlt %*% wanderung
  ergebnisDelta <- ergebnisModell - ergebnisNeu
  
  return (sum(rowSums(ergebnisDelta^2)))
}