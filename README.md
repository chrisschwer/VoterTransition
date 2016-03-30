# VoterTransition

R code for Voter Transition estimates

## The basic problem
From one election to the next, voter transition (Wahlflussanalyse) tries to understand from which party to which party voters shifted.

## The idea
From a previous state (m**n matrix old), e.g. m district with n possible vote expressions (parties / non-votes) an n**p matrix (trans) describes the transition to a new state (m**p matrix new). 

By using a gradient descent approach we can approximate the true trans such that the sum of the squared differences between old %*% trans and new are minimized.

The algorithm assumes that row sums in 'trans' are always equal to 1 (i.e. all voters in the first election are accounted for again in the second election), and that all elements of 'trans' are positive.

## Usage

Descriptions of the variables and functions are provided (in German) in the code of each function.

To account for all votes, it makes sense to have a column for non-voters and also a column for the voters lost or gained between the elections. The sum of all elements in 'old' should be equal to the sum of all elements in 'new'.

The outer functions are 'optimierungWanderung' and 'optimierungWanderungClusters'. The latter allows the split of the data into clusters, calculating different voter transitions for each cluster.

Feel free to contact me for explanation in English.
