// Example of a function to get the user's profile
export const getUserProfile = async () => {
  try {
    const response = await fetch('http://localhost:8000/api/v1/profile', {
      method: 'GET',
      headers: {
        'Authorization': `Bearer ${localStorage.getItem('authToken')}`,
        'Content-Type': 'application/json',
      },
    });
    if (response.ok) {
      return await response.json();  // Return the user profile
    } else {
      throw new Error('Unable to fetch profile');
    }
  } catch (error) {
    console.error(error);
    throw error;
  }
};

// Example of a function to log out the user
export const logout = () => {
  localStorage.removeItem('authToken');  // Clear the auth token from localStorage
  window.location.href = '/login';  // Redirect to login page after logout
};


