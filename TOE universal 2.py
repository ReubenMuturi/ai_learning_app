import numpy as np
import matplotlib.pyplot as plt

# Recreate the x domain and time steps for numerical integration
x = np.linspace(-10, 10, 1000)  # spatial domain
dx = x[1] - x[0]  # spatial step size
t_values = [0.0, 0.5, 1.0, 1.5, 1.99]  # time snapshots

# Define wavefunctions |ψ(x, t)|^2 as approximated in the system (arbitrary normalizations)
psi_squared = {
    0.0: np.exp(-x**2),                     # t = 0.0
    0.5: np.exp(-x**2) * np.cos(x)**2,      # t = 0.5
    1.0: np.exp(-x**2) * np.sin(x)**2,      # t = 1.0
    1.5: np.exp(-x**2) * (np.sin(2*x)**2),  # t = 1.5
    1.99: np.exp(-x**2) * (np.cos(2*x)**2), # t = 1.99
}

# Define gravitational potential Φ(x, t) (arbitrary scaling for demonstration)
gravitational_potential = {
    0.0: 5 * x**2,
    0.5: 5 * x**2 * 0.8,
    1.0: 5 * x**2 * 0.6,
    1.5: 5 * x**2 * 0.4,
    1.99: 5 * x**2 * 0.2,
}

# Initialize energy storage
kinetic_energy = []
potential_energy = []
total_energy = []

# Reduced Planck's constant and mass (arbitrary scaling constants)
hbar = 1.0
m = 1.0

# Numerical integration for energies
for t in t_values:
    # Extract |ψ(x,t)|^2 and Φ(x,t)
    psi2 = psi_squared[t]
    phi = gravitational_potential[t]

    # Kinetic energy: ∫ (hbar^2 / 2m) |∂ψ/∂x|^2 dx
    dpsi_dx = np.gradient(np.sqrt(psi2), dx)
    E_kin = np.sum((hbar**2 / (2 * m)) * (dpsi_dx**2) * dx)

    # Potential energy: ∫ |ψ(x,t)|^2 Φ(x,t) dx
    E_pot = np.sum(psi2 * phi * dx)

    # Total energy
    E_tot = E_kin + E_pot

    # Append to lists
    kinetic_energy.append(E_kin)
    potential_energy.append(E_pot)
    total_energy.append(E_tot)

# Plot the results
plt.figure(figsize=(10, 6))
plt.plot(t_values, kinetic_energy, label="Kinetic Energy")
plt.plot(t_values, potential_energy, label="Potential Energy")
plt.plot(t_values, total_energy, label="Total Energy", linestyle="--", linewidth=2)
plt.xlabel("Time (t)")
plt.ylabel("Energy")
plt.title("Energy Conservation Analysis")
plt.legend()
plt.grid()
plt.show()

# Prepare results for inspection
kinetic_energy, potential_energy, total_energy
