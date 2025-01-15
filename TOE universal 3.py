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


# Orbital velocity formula (simplified approximation)
def orbital_velocity(M1, M2, r):
    return np.sqrt(G * (M1 + M2) / r)


# Frequency evolution for chirp signal (ensure element-wise calculation)
def frequency_evolution(M1, M2, r, t):
    # Ensuring the function works element-wise over time
    return (c / np.pi) * ((5 / 256) * (M1 + M2) / r ** 3) ** 0.5


# Classical strain formula (updated with chirp signal)
def gravitational_wave_strain(M1, M2, r, t, quantum_correction=False):
    # Frequency as a function of time (ensure f_t is an array)
    f_t = frequency_evolution(M1, M2, r, t)

    # Classical strain model with chirp signal
    h_classical = (4 * G * (M1 + M2)) / (c ** 4 * r) * (np.pi * f_t / c) ** (2 / 3)

    # Check: ensure strain is an array with the same shape as t
    if np.ndim(h_classical) == 0:  # If scalar, make it an array
        h_classical = np.full_like(t, h_classical)

    # Quantum correction (frequency-dependent)
    if quantum_correction:
        epsilon = 0.01  # Correction factor (tuned for model)
        tau = 100  # Timescale for quantum decay
        delta_h = epsilon * np.exp(-t / tau) * np.sin(f_t * t)  # Adding frequency-dependent quantum correction
        return h_classical + delta_h
    else:
        return h_classical


# Time array for the simulation
t = np.linspace(0, t_final, 1000)

# Calculate the strain without quantum correction
strain_classical = gravitational_wave_strain(M1, M2, r, t, quantum_correction=False)

# Calculate the strain with quantum correction
strain_quantum = gravitational_wave_strain(M1, M2, r, t, quantum_correction=True)

# Simulated LIGO data (ensure this is a 1D array with same length as t)
strain_data = np.sin(t / 100) * 0.01  # Simulated real LIGO strain data for illustration

# Debugging: print the shapes of the arrays before plotting
print(f"t shape: {t.shape}")
print(f"strain_classical shape: {np.shape(strain_classical)}")
print(f"strain_quantum shape: {np.shape(strain_quantum)}")
print(f"strain_data shape: {strain_data.shape}")

# Plotting the results
plt.figure(figsize=(10, 6))
plt.plot(t, strain_classical, label="Classical Strain", color="blue")
plt.plot(t, strain_quantum, label="Quantum Corrected Strain", color="red", linestyle="--")
plt.plot(t, strain_data, label="Real LIGO Strain", color="green", linestyle=":")

plt.title("Gravitational Wave Strain for GW150914 (Classical vs Quantum Corrected vs LIGO)")
plt.xlabel("Time (seconds)")
plt.ylabel("Strain")
plt.legend()
plt.grid(True)
plt.show()
