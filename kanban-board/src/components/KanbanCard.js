import React from 'react';

function KanbanCard({ taskDescription, columnName, updateTasks }) {
  const handleDragStart = (event) => {
    event.dataTransfer.setData('text/plain', taskDescription);
    event.dataTransfer.setData('column', columnName.toLowerCase());  // Ensure column names are consistent
  };

  const handleDelete = async () => {
    try {
      // Fetch the current tasks from the Flask backend
      const response = await fetch('http://127.0.0.1:5000/api/tasks');
      const storedTasks = await response.json();  // Assuming tasks are returned in JSON format
  
      // Ensure the column exists before trying to filter
      if (!storedTasks[columnName.toLowerCase()]) {
        console.error(`Column ${columnName} does not exist in storedTasks`);
        return;
      }
  
      // Remove task from the current column
      storedTasks[columnName.toLowerCase()] = storedTasks[columnName.toLowerCase()].filter(task => task !== taskDescription);
  
      // Send the updated tasks back to the Flask backend
      await fetch('http://127.0.0.1:5000/api/tasks', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(storedTasks),
      });
  
      // Update the state to trigger re-render
      updateTasks(storedTasks);
    } catch (error) {
      console.error('Error deleting task:', error);
    }
  };

  return (
    <div className="kanban-card" draggable onDragStart={handleDragStart}>
      <p>{taskDescription}</p>
      <button onClick={handleDelete}>Delete</button>
    </div>
  );
}

export default KanbanCard;