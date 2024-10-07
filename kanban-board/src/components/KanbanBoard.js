import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import KanbanColumn from './KanbanColumn';

function KanbanBoard() {
  const [tasks, setTasks] = useState({});

  useEffect(() => {
    // Fetch tasks from Flask API
    fetch('http://127.0.0.1:5000/api/tasks')
      .then((response) => response.json())
      .then((data) => {
        // Initialize columns if they don't exist
        const fetchedTasks = data || {};
        if (!fetchedTasks.start) fetchedTasks.start = [];
        if (!fetchedTasks.research) fetchedTasks.research = [];
        if (!fetchedTasks.analysis) fetchedTasks.analysis = [];
        if (!fetchedTasks.final) fetchedTasks.final = [];
        if (!fetchedTasks.done) fetchedTasks.done = [];

        setTasks(fetchedTasks);  // Set tasks to state
      })
      .catch((error) => console.error('Error fetching tasks:', error));
  }, []);

  const updateTasks = (newTasks) => {
    setTasks(newTasks);  // Update state

    // Send updated tasks to Flask backend
    fetch('http://127.0.0.1:5000/api/tasks', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      body: JSON.stringify(newTasks),
    })
    .then((response) => response.json())
    .then((data) => {
      console.log('Tasks updated:', data);
    })
    .catch((error) => console.error('Error updating tasks:', error));
  };

  return (
    <div>
      <header>
        <h1>Kanban Board</h1>
        <Link to="/add-task">
          <button className="logout-btn">Add Task</button>
        </Link>
      </header>
      <div className="kanban-board">
        <KanbanColumn columnName="Start" tasks={tasks.start || []} updateTasks={updateTasks} />
        <KanbanColumn columnName="Research" tasks={tasks.research || []} updateTasks={updateTasks} />
        <KanbanColumn columnName="Analysis" tasks={tasks.analysis || []} updateTasks={updateTasks} />
        <KanbanColumn columnName="Final" tasks={tasks.final || []} updateTasks={updateTasks} />
        <KanbanColumn columnName="Done" tasks={tasks.done || []} updateTasks={updateTasks} />
      </div>
    </div>
  );
}

export default KanbanBoard;