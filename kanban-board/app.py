from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)

# Add CORS options, specifying your React app's origin
cors_options = {
    "origins": ["http://10.24.0.50:3000"],  
}

# Enable CORS with the options
CORS(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///kanban.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Task(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    description = db.Column(db.String(200), nullable=False)
    column = db.Column(db.String(50), nullable=False)

    def to_dict(self):
        return {
            'id': self.id,
            'description': self.description,
            'column': self.column
        }

with app.app_context():
    db.create_all()

@app.route('/api/tasks', methods=['GET'])
def get_tasks():
    tasks = Task.query.all()
    kanban_tasks = {
        'start': [],
        'research': [],
        'analysis': [],
        'final': [],
        'done': []
    }

    for task in tasks:
        kanban_tasks[task.column].append(task.description)
    
    return jsonify(kanban_tasks)

@app.route('/api/tasks', methods=['POST'])
def update_tasks():
    data = request.get_json()
    Task.query.delete()

    for column, tasks in data.items():
        for task_description in tasks:
            new_task = Task(description=task_description, column=column)
            db.session.add(new_task)

    db.session.commit()

    return jsonify({"message": "Tasks updated successfully!"})

if __name__ == '__main__':
    app.run(debug=True)