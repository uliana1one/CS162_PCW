import React from 'react';
import KanbanCard from './KanbanCard';

function KanbanColumn({ columnName, tasks, updateTasks }) {
  const handleDrop = (event) => {
    event.preventDefault();

    const taskDescription = event.dataTransfer.getData('text/plain');
    const oldColumn = event.dataTransfer.getData('column').toLowerCase();  // Ensure column names are consistent
    const newColumn = columnName.toLowerCase();  // Ensure column names are consistent

    let storedTasks = JSON.parse(localStorage.getItem('kanbanTasks')) || {};

    // Ensure both oldColumn and new column exist
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

    // Update localStorage and the app state
    localStorage.setItem('kanbanTasks', JSON.stringify(storedTasks));
    updateTasks(storedTasks);
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