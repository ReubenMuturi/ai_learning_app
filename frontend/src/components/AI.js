import React, { useState } from 'react';

const AI = () => {
  const [question, setQuestion] = useState('');
  const [response, setResponse] = useState('');

  // Handle form submission
  const handleQuery = async () => {
    if (!question) return;

    alert('Querying AI...');

    try {
      const res = await fetch('http://your-backend-url/api/ai-query', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ question }),
      });

      const data = await res.json();
      setResponse(data.answer);  // Assuming the backend returns a response in the form { answer: "AI's response" }

    } catch (error) {
      console.error('Error querying the AI:', error);
    }
  };

  return (
    <div className="ai-container">
      <h2>Ask the AI</h2>
      <input 
        type="text" 
        placeholder="Ask a question..." 
        value={question} 
        onChange={(e) => setQuestion(e.target.value)} 
      />
      <button onClick={handleQuery}>Submit</button>
      
      {response && (
        <div className="ai-response">
          <h3>AI's Response:</h3>
          <p>{response}</p>
        </div>
      )}
    </div>
  );
};

export default AI;
