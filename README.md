# Master's Thesis
- Exploration of rings of homogeneous and non-homogeneous oscillators using the Ricker model. 
- <a href="DoanHung_Thesis2020.pdf" target="_blank">DoanHung_Thesis2020.PDF</a>

# Motivation
- Master's Thesis: It is the hope that a dynamicist can take the work done in this paper and use it to real-world applicacations.

# Screenshots
![Alt text](ricker.png?raw=true "The Ricker Model")
![Alt text](coupled_rings_case1.png?raw=true "coupled_rings_case1")
![Alt text](case_1.png?raw=true "case_1")

# Tech/framework used
- MATLAB

# How to use
- The .m files below are used to create maps and tangent maps of rings of non-homogeneous oscillators.  To determine if a system is chaotic or not, we can use Lyapunov characteristic explonents (LCEs) using the LCE.m script.  The method used is the HQRB method and the psuedo code for this method can be found in the HQRB.pdf paper attached under 'Credits'

- LCE.m Inputs
  - map - Provided by the 'map_ricker_nearestNeighbor' and 'map_ricker_nearest4Neighbors' functions:
  - tanmap - Provided by the 'tanmap_ricker_nearestNeighbor' and 'tanmap_ricker_nearest4Neighbors' functions
  - iteration - The number of iterations it takes the system to evolve (~2,000,000)
  - lce_iteration - The number of iterations used for LCE Calculation (~50,000)
  - b - The connection strength between neighbors (~0.2)
  - r - The intrinsic growth rate (~3)
  - n - The number of oscillators in a ring (~32)
  - s - The seed value (~1)
  
- map_ricker_nearestNeighbor.m and map_ricker_nearest4Neigbor.m Inputs:
  - iteration - The number of iterations it takes the system to evolve (~2,000,000)
  - b - The connection strength between neighbors (~0.2)
  - r - The intrinsic growth rate (~3)
  - n - The number of oscillators in a ring (~32)
  - s - The seed value (~1)
  
- tanmap_ricker_nearestNeighbor.m and tanmap_ricker_nearest4Neigbors.m Inputs:
  - Ni (map) - Provided by the 'map_ricker_nearestNeighbor' and 'map_ricker_nearest4Neighbors' functions
  - b - The connection strength between neighbors (~0.2)
  - r - The intrinsic growth rate (~3)
  - n - The number of oscillators in a ring (~32)
  - s - The seed value (~1)
  
 # Credits
 - Code in 'LCE.m' based off the psuedo code written by Hubertus von Bremen in <a href="HQRB_paper.pdf" target="_blank">HQRB.pdf</a>
  
 
