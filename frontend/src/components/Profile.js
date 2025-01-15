// Profile.js
import React, { useState, useEffect } from 'react';
import { getUserProfile, logout } from '../authService';  // Corrected imports

const Profile = () => {
  const [profile, setProfile] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchProfile = async () => {
      try {
        const data = await getUserProfile();  // Fetch user profile
        setProfile(data);
      } catch (error) {
        setError('Failed to load profile');
      }
    };

    fetchProfile();
  }, []);

  return (
    <div>
      <h1>Profile</h1>
      {error && <p>{error}</p>}
      {profile ? (
        <div>
          <p>Name: {profile.name}</p>
          <p>Email: {profile.email}</p>
          {/* Render other profile details */}
        </div>
      ) : (
        <p>Loading profile...</p>
      )}

      <button onClick={logout}>Logout</button>
    </div>
  );
};

export default Profile;
