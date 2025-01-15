// frontend/src/components/Lesson.js
import React, { useState, useEffect } from 'react';

const LessonList = () => {
    const [lessons, setLessons] = useState([]);

    useEffect(() => {
        fetch('http://127.0.0.1:8000/lessons/')
            .then(response => response.json())
            .then(data => setLessons(data));
    }, []);

    return (
        <div>
            <h1>Lesson List</h1>
            <ul>
                {lessons.map((lesson) => (
                    <li key={lesson.id}>{lesson.name}</li>
                ))}
            </ul>
        </div>
    );
};

export default LessonList;
