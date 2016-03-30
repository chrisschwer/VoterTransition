optimierungWanderung <- function (ergebnisAlt, ergebnisNeu, wanderung,
                                  iterationen = 1000,
                                  epsilon = 0.0000001, alpha = 0.000000000001,
                                  documentation = FALSE) {
  
  # Führt eine Reihe von updates durch
  # ergebnisAlt : Ausgangswahlergebnis, m * n Matrix für m regionale Einheiten und n Parteien
  # ergebnisNeu : Endwahlergebnis, m * p Matrix für m regionale Einheiten und p Parteien
  # wanderung : Wählerwanderung, n * p Matrix um Wanderung von n auf p Parteien zu modellieren
  # iterationen : Anzahl der iterationen
  # epsilon : Wert, um den der Ausgangswert positiv und negativ variert wird.
  # alpha : Schrittweite
  # documentation : Dokumentation der Ausgangswerte wird zurückgegeben, default ist FALSE
  
  n <- dim (wanderung) [1]
  p <- dim (wanderung) [2]
  
  wanderung_initial <- wanderung
  
  zeilenTitel <- rownames(wanderung)
  spaltenTitel <- colnames(wanderung)
  
  fehler <- data.frame (Schritt = 0,
                        Fehler = fehlerberechnung (ergebnisAlt, ergebnisNeu, wanderung))
  
  for (i in 1:iterationen) {
    wanderung <- updateMatrix (ergebnisAlt, ergebnisNeu, wanderung,
                               n, p, epsilon, alpha)
    
    # Minimalwert 0 festlegen
    wanderung <- matrix (sapply (wanderung, 
                                 function (x) {max (0,x)}),
                         n, p)
    
    # Ggf. die anderen Werte in der Reihe anheben
    wanderung <- wanderung / rowSums (wanderung)
    
    # Ergebnis des Iterationsschritts festhalten
    fehler <- rbind (fehler, c(i, fehlerberechnung (ergebnisAlt, ergebnisNeu, wanderung)))
    
  }
  
  rownames(wanderung) <- zeilenTitel
  colnames(wanderung) <- spaltenTitel
  
  if (documentation) {
    return (list (wanderung = wanderung, Errors = fehler,
                  ergebnisAlt = ergebnisAlt, ergebnisNeu = ergebnisNeu,
                  wanderung_initial = wanderung_initial,
                  Iterationen = iterationen, Epsilon = epsilon,
                  Alpha = alpha
  ))} else {
    return (list (Wanderung = wanderung, Errors = fehler))
  }
  
  
}