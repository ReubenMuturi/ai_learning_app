import React, { useState } from 'react';
import { BrowserRouter as Router, Route, Routes, Link, Navigate } from 'react-router-dom';
import Login from './Login';
import Home from './Home';
import Profile from './Profile';
import Progress from './Progress';
import AI from './AI';

function App() {
  const [isAuthenticated, setIsAuthenticated] = useState(false);

  console.log('App component is rendering'); // This should appear in the browser console

  return (
    <Router>
      <div>
        {/* Conditional Navbar */}
        {isAuthenticated && (
          <nav>
            <ul>
              <li><Link to="/home">Home</Link></li>
              <li><Link to="/profile">Profile</Link></li>
              <li><Link to="/progress">Progress</Link></li>
              <li><Link to="/ai">AI</Link></li>
            </ul>
          </nav>
        )}

        <Routes>
          <Route
            path="/"
            element={isAuthenticated ? <Home setIsAuthenticated={setIsAuthenticated} /> : <Navigate to="/login" />}
          />
          <Route
            path="/login"
            element={<Login setIsAuthenticated={setIsAuthenticated} />}
          />
          <Route
            path="/home"
            element={isAuthenticated ? <Home setIsAuthenticated={setIsAuthenticated} /> : <Navigate to="/login" />}
          />
          <Route
            path="/profile"
            element={isAuthenticated ? <Profile /> : <Navigate to="/login" />}
          />
          <Route
            path="/progress"
            element={isAuthenticated ? <Progress /> : <Navigate to="/login" />}
          />
          <Route
            path="/ai"
            element={isAuthenticated ? <AI /> : <Navigate to="/login" />}
          />
          <Route path="*" element={<Navigate to={isAuthenticated ? "/home" : "/login"} />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
