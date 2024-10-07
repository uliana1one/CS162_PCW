import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

function AddTask() {
  const [taskDescription, setTaskDescription] = useState('');
  const [selectedColumn, setSelectedColumn] = useState('start');
  const navigate = useNavigate();

  // Modify handleSubmit to send data to Flask backend
  const handleSubmit = async (event) => {
    event.preventDefault();

    // Fetch the current tasks from the backend (instead of localStorage)
    try {
      const response = await fetch('http://127.0.0.1:5000/api/tasks');
      const tasks = await response.json();  // Assuming tasks are returned in JSON format

      // Ensure the column exists in the tasks object
      if (!tasks[selectedColumn]) tasks[selectedColumn] = [];

      // Add the new task to the selected column
      tasks[selectedColumn].push(taskDescription);

      // Send the updated tasks back to the Flask backend
      await fetch('http://127.0.0.1:5000/api/tasks', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(tasks),
      });

      // Navigate back to the Kanban board after submitting
    
    } catch (error) {
      console.error('Error updating tasks:', error);
    }
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