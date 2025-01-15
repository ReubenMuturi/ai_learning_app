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


# Simulate the gravitational wave strain (classical + quantum correction)
def gravitational_wave_strain(M1, M2, r, t, quantum_correction=False):
    v = orbital_velocity(M1, M2, r)

    # Classical strain formula for each time step
    h_classical = (4 * G * (M1 + M2)) / (r * v)  # Simplified version

    # Quantum correction (assuming small correction for simplicity)
    if quantum_correction:
        delta_h = np.exp(-t / 100) * 0.01  # Example correction term
        return h_classical + delta_h
    else:
        return np.full_like(t, h_classical)  # Return an array with the same value for each time step


# Time array
t = np.linspace(0, t_final, 1000)

# Calculate the strain without quantum correction
strain_classical = gravitational_wave_strain(M1, M2, r, t, quantum_correction=False)

# Calculate the strain with quantum correction
strain_quantum = gravitational_wave_strain(M1, M2, r, t, quantum_correction=True)

# Plotting the results
plt.figure(figsize=(10, 6))
plt.plot(t, strain_classical, label="Classical Strain", color="blue")
plt.plot(t, strain_quantum, label="Quantum Corrected Strain", color="red", linestyle="--")
plt.title("Gravitational Wave Strain for GW150914 (Classical vs Quantum Corrected)")
plt.xlabel("Time (seconds)")
plt.ylabel("Strain")
plt.legend()
plt.grid(True)
plt.show()
