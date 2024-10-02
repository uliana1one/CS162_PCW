import React from 'react';
import { Link } from 'react-router-dom';

function Header() {
  return (
    <header>
      <h1>Kanban Board</h1>
      <Link to="/add-task">
        <button className="add-task-btn">Add Task</button>
      </Link>
    </header>
  );
}

export default Header;