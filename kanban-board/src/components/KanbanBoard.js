import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import KanbanColumn from './KanbanColumn';

function KanbanBoard() {
  const [tasks, setTasks] = useState({});

  useEffect(() => {
    let storedTasks = JSON.parse(localStorage.getItem('kanbanTasks')) || {};

    // Initialize columns if they don't exist
    if (!storedTasks.start) storedTasks.start = [];
    if (!storedTasks.research) storedTasks.research = [];
    if (!storedTasks.analysis) storedTasks.analysis = [];
    if (!storedTasks.final) storedTasks.final = [];
    if (!storedTasks.done) storedTasks.done = [];

    setTasks(storedTasks);
    localStorage.setItem('kanbanTasks', JSON.stringify(storedTasks)); // Ensure storage is updated
  }, []);

  const updateTasks = (newTasks) => {
    setTasks(newTasks);  // Update state
    localStorage.setItem('kanbanTasks', JSON.stringify(newTasks));  // Update localStorage
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