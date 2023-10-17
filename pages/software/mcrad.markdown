---
layout: page
title: "MCRAD: Monte Carlo RAdiation Diffusion"
permalink: /code/mcrad
---

***Monte Carlo*** **RAdiation Diffusion (MCRAD)** is a software tool I developed
to describe how light travels and spreads out through matter, especially *turbid*
or ''grainy'' materials. **MCRAD** is especially useful to investigate how light 
moves through bacterial films, where light diffusion can make imaging difficult. It 
also can be used to investigate how light travels through the atmosphere causing, *e.g.*,
the sky to appear blue and clouds to appear grey or white.
The code is available on my Github account
[here](https://github.com/jmherzog-umich/PhotonTransport).

<!--more-->

The *Monte Carlo* (MC) method uses statistics to predict how light moves through a bulk
material. Imagine playing a game of pool. During the break shot, the cue ball is launched into 
the other balls, sending the cue ball and object balls randomly in all directions. The MC method 
works by launching a group of photon packets (similar to the cue ball) into a space filled with 
particles such as water droplets or bacteria cells (similar to the object balls). The **MCRAD**
code tracks the location of the photon packets, and uses statistics to describe how light 
diffuses through the material on average.

<figure>
  <div class="multicolumn">
    <div class="column">
      <img src="/figures/mcrad-pooltable-annotated.png" alt="Illustration of billiard ball scattering" style="width:100%">
    </div>
    <div class="column">
      <img src="/figures/mcrad-diagram.png" alt="Illustration of photon scattering" style="width:100%">
    </div>
  </div>
  <figcaption><strong>Left:</strong> Illustration of billiard ball "scattering" off of object balls. <strong>Right:</strong> illustration of photons propagating through a medium.
  Red shading indicates the average light intensity, and magenta lines indicate several individual photon paths. On average, scattering causes a beam of light to spread out or diffuse 
  through the medium. </figcaption>
</figure>

**MCRAD** tracks a variety of quantities including:
- amount and locations of incident light that is absorbed, transmitted, and reflected,
- angular distribution of transmitted and reflected light,
- scattering order and time delay of transmission, reflection, and absorption,
- beam radius and penetration depth, and
- fluorescence generation, reabsorption, and transmission intensity and location.
In addition, images can be simulated using scattered or fluorescence light.

The following figures demonstrate some example results from **MCRAD** that are used in my research.

<!--more-->

<figure>
  <img src="/figures/mcrad-raypaths.png" alt="Photon paths in a scattering medium" style="width:50%; display: block; margin: auto;">
  <figcaption>Calculated photon paths in an <em>E. coli</em> biofilm (left) compared with paths through a
   transparent medium calculated with MCRAD. In the biofilm, photon packets frequently collide with cells
   which deflects the packets slightly. Each interaction additionally provides an opportunity for a photon
   to be absorbed, reducing the "weight" or intensity of the photon packet. From the illustration, photons appear
   to only penetrate through about 30 microns of the biofilm for this condition. </figcaption>
</figure>
