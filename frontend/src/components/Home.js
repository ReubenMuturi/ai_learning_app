import React from 'react';
import { Link } from 'react-router-dom';

const Home = ({ setIsAuthenticated }) => {
  const handleLogout = () => {
    setIsAuthenticated(false);
  };

  return (
    <div>
      <h1>Welcome to the AI Learning App</h1>
      <h2>Welcome back, User!</h2>

      {/* Test content */}
      <div>Hello World</div>

      <div className="buttons-container">
        <Link to="/profile">
          <button>Profile</button>
        </Link>
        <Link to="/progress">
          <button>Progress</button>
        </Link>
        <Link to="/ai">
          <button>AI</button>
        </Link>
        <button onClick={handleLogout}>Logout</button>
      </div>
    </div>
  );
};

export default Home;
