1. **What is Flask and why is it considered a microframework?**
   Flask is a lightweight Python web framework that provides the basics to build web applications without prebuilt tools like database or authentication, giving developers flexibility.

2. **Roles of parts in a Flask app**:
   - **templates**: HTML files that display dynamic content.
   - **static files**: CSS, JavaScript, images.
   - **requirements.txt**: List of required libraries.
   - **virtual environment (venv)**: Isolated Python environment for dependencies.
   - **render_template**: Renders an HTML file with variables.
   - **redirect**: Redirects the user to a different URL.
   - **url_for**: Generates a URL for a specific function.
   - **session**: Stores data between requests.

3. **Commands**:
   - **`pip3 install -r requirements.txt`**: Installs dependencies listed in the file.
   - **`export FLASK_APP=app`**: Tells Flask which file to run.
   - **`python3 -m flask run`**: Starts the Flask app.

4. **Differences between two ways to run a Flask app**:
   - **`export FLASK_APP=app.py` + `flask run`**: Flask manages running the app and hot-reloads.
   - **`python3 app.py`**: Runs the app directly without Flask management; use when you want simplicity and no hot-reloading.

5. **Why define specific versions in `requirements.txt`?**
   To ensure compatibility and prevent bugs due to updates. Use `pip freeze` to find versions.

6. **What is `@app.route`?**
   It's a **decorator** that maps a URL to a function. The default method is `GET`.

7. **What is a decorator?**
   A function that modifies another function. In Flask, decorators like `@app.route` map functions to URLs.

8. **What is the `config` attribute?**
   Used to configure settings in a Flask app. Example:
   ```python
   app.config['TESTING'] = True
   app.config['SECRET_KEY'] = 'abc'
   ```

9. **What is JSON and why use it?**
   JSON (JavaScript Object Notation) is a lightweight data format that is easy for humans to read and for machines to parse.

10. **Default host and port in Flask?**
    Default is `localhost` and port `5000`. Change with:
    ```bash
    flask run --host=0.0.0.0 --port=8080
    ```

---
I used AI for rormatting and text structure