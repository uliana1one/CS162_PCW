import React from 'react';

function KanbanCard({ taskDescription, columnName, updateTasks }) {
  const handleDragStart = (event) => {
    event.dataTransfer.setData('text/plain', taskDescription);
    event.dataTransfer.setData('column', columnName.toLowerCase());  // Ensure column names are consistent
  };

  const handleDelete = () => {
    let storedTasks = JSON.parse(localStorage.getItem('kanbanTasks')) || {};

    // Ensure the column exists before trying to filter
    if (!storedTasks[columnName.toLowerCase()]) {
      console.error(`Column ${columnName} does not exist in storedTasks`);
      return;
    }

    // Remove task from the current column
    storedTasks[columnName.toLowerCase()] = storedTasks[columnName.toLowerCase()].filter(task => task !== taskDescription);

    // Update localStorage and state
    localStorage.setItem('kanbanTasks', JSON.stringify(storedTasks));
    updateTasks(storedTasks);  // Update state to trigger re-render
  };

  return (
    <div className="kanban-card" draggable onDragStart={handleDragStart}>
      <p>{taskDescription}</p>
      <button onClick={handleDelete}>Delete</button>
    </div>
  );
}

export default KanbanCard;