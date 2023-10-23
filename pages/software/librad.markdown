---
layout: page
title: "librad: C++ Radiative Transfer Library"
permalink: /code/librad
---

**librad** is a C++ library that calculates a variety of functions used in 
Chandrasekhar's radiative transfer theory[^1] including the $$ X $$, $$ Y $$, and $$ H $$
functions. These functions can be used to calculate diffuse reflection, transmission
and absorption coefficients for strongly scattering materials, even for strongly
anisotropic cases. The code contains no external dependencies and uses only the 
C++ standard library. The code is available on my Github account
[here](https://github.com/jmherzog-umich/librad).

<!--more-->

**librad** implements several components including:
- a variety of numeric integration/quadrature routines
  1.  Tanh-Sinh (or double-exponential) quadrature
  2.  Gaussian-Legendre quadrature using an asymptotic expansion [^2] [^3]
  3.  A variety of related single- and double-exponential methods
- Several explicit Runge-Kutta ODE solvers
- iterative solutions to $$H$$, $$X$$, and $$Y$$
- approximate analytic solutions to $$H$$ [^4]
- reflectance, transmittance, and absorbance calculations for a planar layer

Some solutions for isotropic scattering are presented in the following figures.

<figure>
  <img src="/figures/librad-H.png" alt="Plots of Chandrasekhar's H-function for isotropic scattering" style="width:100%">
  <figcaption>Several plots of Chandrasekhar's H-function for isotropic scattering calculated with librad as a function of incidence angle with several albedo values (left) and a heatmap illustrating H for a wider range of conditions (right).</figcaption>
</figure>

<figure>
  <img src="/figures/librad-X.png" alt="Plots of Chandrasekhar's X-function for isotropic scattering" style="width:100%">
  <figcaption>Several plots of Chandrasekhar's X-function for isotropic scattering at normal incidence calculated with librad as a function of optical thickness (left) and heatmap illustrating X at a wider range of conditions.</figcaption>
</figure>

<figure>
  <img src="/figures/librad-Y.png" alt="Plots of Chandrasekhar's Y-function for isotropic scattering" style="width:100%">
  <figcaption>Several plots of Chandrasekhar's Y-function for isotropic scattering at normal incidence calculated with librad as a function of optical thickness (left) and heatmap illustrating Y at a wider range of conditions.</figcaption>
</figure>

**librad** evaluates the $$X$$ and $$Y$$ functions iteratively through the following integro-differential equations

$$\begin{aligned}
	\frac{\partial Y}{\partial\tau} + \frac{Y}{\mu} = X \overset{1}{\underset{0}{\int}} \frac{du}{u} \; \Phi(u) Y \\
	\frac{\partial X}{\partial \tau} = Y \overset{1}{\underset{0}{\int}} \frac{du}{u} \; \Phi(u) Y 
\end{aligned} $$

subject to the initial condition

$$X(\tau=0,\mu) = Y(\tau=0,\mu) = 1. $$

for $$\mu > 0$$. The $$H$$ function for the isotropic scattering case is evaluated using a closed form integral representation[^5] that requires
only a single numeric integral:

$$ \ln H = -\frac{\mu}{\pi} \overset{\frac{\pi}{2}}{\underset{0}{\int}} \frac{\ln (1 - \alpha x \cot x)}{\cos^2 x + \mu^2 \sin^2 x} dx $$

for the isotropic scattering case where $$\alpha$$ is the albedo. 

[^1]: *Chandrasekhar, Subrahmanyan. Radiative transfer. Dover publications, 1960.*
[^2]: *Bogaert, Ignace. "Iteration-free computation of Gauss--Legendre quadrature nodes and weights." SIAM Journal on Scientific Computing 36.3 (2014): A1008-A1026.*
[^3]: *Bogaert, Ignace. "Fast Gauss-Legendre Quadrature Rules", http://sourceforge.net/projects/fastgausslegendrequadrature.*
[^4]: *Davidović, Dragomir M., Jovan Vukanić, and Dušan Arsenović. "Two new analytic approximations of the Chandrasekhar's H function for isotropic scattering." Icarus 194.1 (2008): 389-397.*
[^5]: *Kawabata, Kiyoshi, and Sanjay S. Limaye. "Rational approximation formula for Chandrasekhar’s H-function for isotropic scattering." Astrophysics and Space Science 332.2 (2011): 365-371.*

