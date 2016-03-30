updateMatrix <- function (ergebnisAlt, ergebnisNeu, wanderung,
                          n, p, epsilon = 0.0000001, alpha = 0.000000000001) {
  
  # Berechnet ein besseres Ergebnis für die Wanderungsmatrix, ohne die Randbedingungen zu beachten
  # ergebnisAlt : Ausgangswahlergebnis, m * n Matrix für m regionale Einheiten und n Parteien
  # ergebnisNeu : Endwahlergebnis, m * p Matrix für m regionale Einheiten und p Parteien
  # wanderung : Wählerwanderung, n * p Matrix um Wanderung von n auf p Parteien zu modellieren
  # n, p : Dimensionen der Matrix wanderung -- aus Performancegründen mitzuliefern
  # epsilon : Wert, um den der Ausgangswert positiv und negativ variert wird.
  # alpha : Schrittweite
  
  wanderung <- wanderung - 
    (alpha * fehlerGradient (ergebnisAlt, ergebnisNeu, wanderung,
                             n, p, epsilon))
  
  return (wanderung)
}