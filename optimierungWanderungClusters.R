optimierungWanderungClusters <- function (ergebnisAlt, ergebnisNeu, wanderung,
                                          iterationen = 1000,
                                          epsilon = 0.0000001, alpha = 0.000000000001,
                                          documentation = FALSE,
                                          clusterids) {
  
  # Führt eine Reihe von updates durch, nachdem die Ausgangsmatrizen in Gruppen
  # aufgeteilt werden 
  # ergebnisAlt : Ausgangswahlergebnis, m * n Matrix für m
  # regionale Einheiten und n Parteien 
  # ergebnisNeu : Endwahlergebnis, m * p
  # Matrix für m regionale Einheiten und p Parteien 
  # wanderung : Wählerwanderung,
  # n * p Matrix um Wanderung von n auf p Parteien zu modellieren 
  # iterationen : Anzahl der iterationen 
  # epsilon : Wert, um den der Ausgangswert positiv und
  # negativ variert wird. 
  # alpha : Schrittweite 
  # documentation : Dokumentation der
  # Ausgangswerte wird zurückgegeben, default ist FALSE
  # clusterids : Vektor der Cluster IDs
  
  numberClusters <- length (clusterids)
  wanderung_initial <- wanderung
  
  relativ <- list()
  fehler <- list()
  absolut <- list()
  gesamt <- matrix (0, dim (wanderung)[1], dim (wanderung)[2])
  
  for (i in 1:numberClusters) {
    # Aufteilen der Vektoren auf die Cluster
    alt <- subset (ergebnisAlt, clusterids == i)
    neu <- subset (ergebnisNeu, clusterids == i)
    
    # Optimieren der (relativen) Wanderungsmatrizen
    temp <- optimierungWanderung (alt, neu, wanderung_initial,
                                  iterationen,
                                  epsilon, alpha,
                                  documentation = FALSE)
    relativ [[i]] <- temp$Wanderung
    fehler[[i]] <- temp$Errors
    
    # Absolute Übergänge rechnen
    absolut [[i]] <- colSums(alt) * temp$Wanderung
    
    # Aufaddieren der absoluten Übergänge
    gesamt <- gesamt + absolut [[i]]
    
  }
  if (documentation) {
    return (list (Gesamt = gesamt, Wanderung = relativ,
                  Errors = fehler, ergebnisAlt = ergebnisAlt, 
                  ergebnisNeu = ergebnisNeu, wanderung = wanderung_initial,
                  Epsilon = epsilon, Alpha = alpha, ClusterIDs = clusterids
                  ))
  } else {
    return (list (Gesamt = gesamt, Wanderung = relativ,
                  Errors = fehler))  
  }
  
  
  
  
  
}
  