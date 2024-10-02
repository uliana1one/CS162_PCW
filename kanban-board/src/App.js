import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import AddTask from './components/AddTask';
import KanbanBoard from './components/KanbanBoard';
import './App.css';

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/add-task" element={<AddTask />} />
        <Route path="/" element={<KanbanBoard />} />
      </Routes>
    </Router>
  );
}

export default App;