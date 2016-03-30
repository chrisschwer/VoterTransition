# VoterTransition

R code for Voter Transition estimates

## The basic problem
From one election to the next, voter transition (Wahlflussanalyse) tries to understand from which party to which party voters shifted.

## The idea
From a previous state (m**n matrix old), e.g. m district with n possible vote expressions (parties / non-votes) an n**p matrix (trans) describes the transition to a new state (m**p matrix new). 

By using a gradient descent approach we can approximate the true trans such that the sum of the squared differences between old %*% trans and new are minimized.

## Usage

Descriptions of the variables and functions are provided (in German) in the code of each function.

The outer functions are 'optimierungWanderung' and 'optimierungWanderungClusters'. The latter allows the split of the data into clusters, calculating different voter transitions for each cluster.

Feel free to contact me for explanation in English.
