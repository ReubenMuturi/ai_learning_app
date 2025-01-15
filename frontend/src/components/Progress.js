import React, { useState, useEffect } from 'react';

const Progress = () => {
  const [progress, setProgress] = useState(0);

  useEffect(() => {
    // Here, you would call an API or get data from local storage
    const storedProgress = localStorage.getItem('userProgress');
    setProgress(storedProgress ? JSON.parse(storedProgress) : 0);
  }, []);

  return (
    <div className="progress-container">
      <h2>Your Progress</h2>
      <p>Track your progress and stay motivated!</p>
      <progress value={progress} max="100"></progress>
      <p>{progress}% completed</p>
    </div>
  );
};

export default Progress;
