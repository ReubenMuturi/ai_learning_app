import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

// Helper function to get CSRF token from cookies
const getCSRFToken = () => {
  const name = 'csrftoken=';
  const decodedCookies = decodeURIComponent(document.cookie);
  const cookies = decodedCookies.split(';');
  
  for (let i = 0; i < cookies.length; i++) {
    let cookie = cookies[i];
    while (cookie.charAt(0) === ' ') {
      cookie = cookie.substring(1);
    }
    if (cookie.indexOf(name) === 0) {
      return cookie.substring(name.length, cookie.length);
    }
  }
  return '';
};

const Login = ({ setIsAuthenticated }) => {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState(null);
  const [successMessage, setSuccessMessage] = useState(null);
  const navigate = useNavigate();

  const handleLoginClick = async (e) => {
    e.preventDefault(); // Prevent form submission
    try {
      const response = await fetch('http://127.0.0.1:8000/api/auth/login/', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          email,
          password,
        }),
      });
  
      if (!response.ok) {
        const errorData = await response.json();
        setError(errorData?.error || 'Unknown error');
        setSuccessMessage(null);
      } else {
        const data = await response.json();
        setSuccessMessage('Login successful!');
        setError(null);
        setIsAuthenticated(true);
        navigate('/home'); // Redirect after successful login
      }
    } catch (error) {
      setError('An unexpected network error occurred. Please try again.');
      setSuccessMessage(null);
    }
  };
  

  return (
    <div className="login-container">
      <h2>Login</h2>
      {/* The JSX form is here */}
      <form onSubmit={handleLoginClick}>
        <div>
          <label>Email</label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)} // Update email state
            required
          />
        </div>
        <div>
          <label>Password</label>
          <input
            type="password"
            value={password}
            onChange={(e) => setPassword(e.target.value)} // Update password state
            required
          />
        </div>
        <button type="submit">Login</button> {/* Submit the form */}
      </form>
  
      {/* Success and Error Messages */}
      {successMessage && <p style={{ color: 'green' }}>{successMessage}</p>}
      {error && <p style={{ color: 'red' }}>{error}</p>}
    </div>
  );
}  

export default Login;
