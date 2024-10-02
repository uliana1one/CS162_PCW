import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function AddTask() {
  const [taskDescription, setTaskDescription] = useState('');
  const [selectedColumn, setSelectedColumn] = useState('start');
  const navigate = useNavigate();

  const handleSubmit = (event) => {
    event.preventDefault();
    const tasks = JSON.parse(localStorage.getItem('kanbanTasks')) || {};
    if (!tasks[selectedColumn]) tasks[selectedColumn] = [];
    tasks[selectedColumn].push(taskDescription);
    localStorage.setItem('kanbanTasks', JSON.stringify(tasks));
    navigate('/');
  };

  return (
    <div className="form-container">
      <h2>Add a New Task</h2>
      <form onSubmit={handleSubmit}>
        <label htmlFor="task">Task Description</label>
        <input
          type="text"
          id="task"
          value={taskDescription}
          onChange={(e) => setTaskDescription(e.target.value)}
          placeholder="Write your task here..."
          required
        />
        <label htmlFor="column">Choose Column</label>
        <select
          id="column"
          value={selectedColumn}
          onChange={(e) => setSelectedColumn(e.target.value)}
        >
          <option value="start">Start</option>
          <option value="research">Research</option>
          <option value="analysis">Analysis</option>
          <option value="final">Final</option>
          <option value="done">Done</option>
        </select>
        <input type="submit" value="Add Task" />
      </form>
    </div>
  );
}

export default AddTask;