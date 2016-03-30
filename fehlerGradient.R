fehlerGradient <- function (ergebnisAlt, ergebnisNeu, wanderung,
                            n, p,
                            epsilon = 0.0000001) {
  
  # Berechnet die Gradienten der Fehler für alle Zellen der Wanderungsmatrix
  # ergebnisAlt : Ausgangswahlergebnis, m * n Matrix für m regionale Einheiten und n Parteien
  # ergebnisNeu : Endwahlergebnis, m * p Matrix für m regionale Einheiten und p Parteien
  # wanderung : Wählerwanderung, n * p Matrix um Wanderung von n auf p Parteien zu modellieren
  # n, p : Dimensionen der Matrix wanderung -- aus Performancegründen mitzuliefern
  # epsilon : Wert, um den der Ausgangswert positiv und negativ variert wird.
  
  wanderung_gradient <- wanderung
  
  for (i in 1:n) {
    for (j in 1:p) {
      wanderung_minus <- wanderung
      wanderung_plus <- wanderung
      wanderung_minus[i, j] <- wanderung[i,j] - epsilon
      wanderung_plus[i, j] <- wanderung[i,j] + epsilon
      wanderung_minus[i,] <- wanderung_minus[i,] / (1 - epsilon)
      wanderung_plus[i,] <- wanderung_plus[i,] / (1 + epsilon)
      wanderung_gradient[i,j] <- (fehlerberechnung (ergebnisAlt, ergebnisNeu, wanderung_plus) -
                                    fehlerberechnung (ergebnisAlt, ergebnisNeu, wanderung_minus)) /
        (2*epsilon)
    }
  }
  
  return (wanderung_gradient)
  
}