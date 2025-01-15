import numpy as np
import matplotlib.pyplot as plt

# Constants
G = 6.67430e-11  # Gravitational constant (m^3 kg^-1 s^-2)
c = 3e8  # Speed of light in m/s

# Parameters for GW150914 (binary black hole merger)
M1 = 36 * 1.989e30  # mass of first black hole (kg)
M2 = 29 * 1.989e30  # mass of second black hole (kg)
r = 410 * 3.085677581e22  # distance (m), converted from Mpc
t_final = 1000  # Final time for the simulation (seconds)

# Frequency evolution with PN approximation (non-linear, chirp-like)
def frequency_evolution(M1, M2, r, t):
    # Total mass and chirp mass
    M_total = M1 + M2
    M_chirp = (M1 * M2)**(3/5) / M_total**(1/5)  # Chirp mass

    # Frequency evolution according to the PN approximation: f(t) ~ (t_final - t)^(-3/8)
    f_t = (t_final - t)**(-3/8) * (M_chirp / (5))  # Adjust for chirp (corrected here)

    return f_t

# Classical strain formula with chirp-like frequency evolution
def refined_gravitational_wave_strain(M1, M2, r, t):
    # Frequency evolution based on gravitational wave theory (chirp)
    f_t = frequency_evolution(M1, M2, r, t)

    # Strain amplitude with respect to frequency
    strain_amplitude = (4 * G * (M1 + M2)) / (c ** 4 * r) * 1e22  # Adjust scale factor

    # Oscillatory strain with frequency evolution
    h_oscillatory = strain_amplitude * np.sin(2 * np.pi * f_t * t)  # Oscillation

    return h_oscillatory, f_t  # Return both strain and frequency evolution

# Time array for the simulation
t = np.linspace(0, t_final, 1000)

# Calculate the strain and frequency evolution
strain_classical, f_t = refined_gravitational_wave_strain(M1, M2, r, t)

# Plot frequency evolution and strain to visualize the results
plt.figure(figsize=(10, 6))

# Frequency evolution plot
plt.subplot(2, 1, 1)
plt.plot(t, f_t, label="Frequency Evolution (f_t)")
plt.title("Frequency Evolution of Gravitational Waves")
plt.xlabel("Time (seconds)")
plt.ylabel("Frequency (Hz)")
plt.grid(True)

# Strain plot
plt.subplot(2, 1, 2)
plt.plot(t, strain_classical, label="Refined Strain", color="blue")
plt.title("Refined Gravitational Wave Strain for GW150914")
plt.xlabel("Time (seconds)")
plt.ylabel("Strain")
plt.grid(True)

plt.tight_layout()
plt.show()



