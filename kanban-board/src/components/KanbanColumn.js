import React from 'react';
import KanbanCard from './KanbanCard';

function KanbanColumn({ columnName, tasks, updateTasks }) {
  const handleDrop = async (event) => {
    event.preventDefault();

    const taskDescription = event.dataTransfer.getData('text/plain');
    const oldColumn = event.dataTransfer.getData('column').toLowerCase();  // Ensure column names are consistent
    const newColumn = columnName.toLowerCase();  // Ensure column names are consistent

    try {
      // Fetch the current tasks from the Flask backend
      const response = await fetch('http://127.0.0.1:5000/api/tasks');
      const storedTasks = await response.json();  // Assuming tasks are returned in JSON format

      // Ensure both oldColumn and newColumn exist
      if (!storedTasks[oldColumn]) {
        storedTasks[oldColumn] = [];
      }
      if (!storedTasks[newColumn]) {
        storedTasks[newColumn] = [];
      }

      // Remove the task from the old column
      storedTasks[oldColumn] = storedTasks[oldColumn].filter(task => task !== taskDescription);

      // Add the task to the new column
      storedTasks[newColumn].push(taskDescription);

      // Send the updated tasks back to the Flask backend
      await fetch('http://127.0.0.1:5000/api/tasks', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(storedTasks),
      });

      // Update the app state to trigger a re-render
      updateTasks(storedTasks);
    } catch (error) {
      console.error('Error updating tasks:', error);
    }
  };

  return (
    <div className="kanban-column" onDrop={handleDrop} onDragOver={(e) => e.preventDefault()}>
      <h2>{columnName}</h2>
      {tasks.map((task, index) => (
        <KanbanCard 
          key={index} 
          taskDescription={task} 
          columnName={columnName} 
          updateTasks={updateTasks} 
        />
      ))}
    </div>
  );
}

export default KanbanColumn;