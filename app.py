from flask import Flask, render_template, flash, redirect, url_for, session, request, logging
#from data import Articles
from flask_mysqldb import MySQL
from wtforms import Form, StringField, TextAreaField, PasswordField, validators
from passlib.hash import sha256_crypt
from functools import wraps

app = Flask(__name__)

# Config MySQL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'myflaskapp'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
# init MYSQL
mysql = MySQL(app)

# Index
@app.route('/')
def index():
    return render_template('home.html')

@app.route('/view_excel')
def view_excel():
    return render_template('view_excel.html')

# About
@app.route('/about')
def about():
    return render_template('about.php')

@app.route('/coba')
def coba():
    # Create cursor
    cur = mysql.connection.cursor()

    # Get location
    result = cur.execute("SELECT * FROM loc")

    coba = cur.fetchall()

    if result > 0:
        return render_template('coba.html', coba=coba)

    else:
        msg = 'No Coba Found'
        return render_template('coba.html', msg=msg)

    # Close connection
    cur.close()

# @app.route('/hasil')
# def hasil():
#     # Create cursor
#     cur = mysql.connection.cursor()
#
#     # Get articles
#     result = cur.execute("SELECT cek, COUNT(cek) AS frekuensii_cek, ROUND((COUNT(cek)/(SELECT COUNT(*) FROM coba))*100,0) AS presentase FROM coba where cek='False' GROUP BY cek")
#
#     hasil = cur.fetchall()
#
#     if result > 0:
#         return render_template('hasil.html', hasil=hasil)
#     else:
#         msg = 'No Coba Found'
#         return render_template('hasil.html', msg=msg)
#
#     # Close connection
#     cur.close()


@app.route('/location')
def location():
    # Create cursor
    cur = mysql.connection.cursor()

    # Get articles
    result = cur.execute("SELECT * FROM coba")

    location = cur.fetchall()

    if result > 0:
        return render_template('location.html', location=location)
    else:
        msg = 'No Location Found'
        return render_template('location.html', msg=msg)
    # Close connection
    cur.close()

@app.route('/cek_loc')
def cek_loc():
    # Create cursor
    cur = mysql.connection.cursor()

    # Get articles
    result = cur.execute("SELECT * FROM cek_loc")

    cek_loc = cur.fetchall()

    if result > 0:
        return render_template('cek_loc.html', cek_loc=cek_loc)
    else:
        msg = 'No Location Found'
        return render_template('cek_loc.html', msg=msg)
    # Close connection
    cur.close()

# Articles
@app.route('/articles')
def articles():
    # Create cursor
    cur = mysql.connection.cursor()

    # Get articles
    result = cur.execute("SELECT * FROM articles")

    articles = cur.fetchall()

    if result > 0:
        return render_template('articles.html', articles=articles)
    else:
        msg = 'No Articles Found'
        return render_template('articles.html', msg=msg)
    # Close connection
    cur.close()


#Single Article
@app.route('/article/<string:id>/')
def article(id):
    # Create cursor
    cur = mysql.connection.cursor()

    # Get article
    result = cur.execute("SELECT * FROM articles WHERE id = %s", [id])

    article = cur.fetchone()

    return render_template('article.html', article=article)


# Register Form Class
class RegisterForm(Form):
    name = StringField('Name', [validators.Length(min=1, max=50)])
    username = StringField('Username', [validators.Length(min=4, max=25)])
    email = StringField('Email', [validators.Length(min=6, max=50)])
    password = PasswordField('Password', [
        validators.DataRequired(),
        validators.EqualTo('confirm', message='Passwords do not match')
    ])
    confirm = PasswordField('Confirm Password')


# User Register
@app.route('/register', methods=['GET', 'POST'])
def register():
    form = RegisterForm(request.form)
    if request.method == 'POST' and form.validate():
        name = form.name.data
        email = form.email.data
        username = form.username.data
        password = sha256_crypt.encrypt(str(form.password.data))

        # Create cursor
        cur = mysql.connection.cursor()

        # Execute query
        cur.execute("INSERT INTO users(name, email, username, password) VALUES(%s, %s, %s, %s)", (name, email, username, password))

        # Commit to DB
        mysql.connection.commit()

        # Close connection
        cur.close()

        flash('You are now registered and can log in', 'success')

        return redirect(url_for('login'))
    return render_template('register.html', form=form)


# User login
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        # Get Form Fields
        username = request.form['username']
        password_candidate = request.form['password']

        # Create cursor
        cur = mysql.connection.cursor()

        # Get user by username
        result = cur.execute("SELECT * FROM users WHERE username = %s", [username])

        if result > 0:
            # Get stored hash
            data = cur.fetchone()
            password = sha256_crypt.encrypt('password')

            # Compare Passwords
            if sha256_crypt.verify('password', password):
                # Passed
                session['logged_in'] = True
                session['username'] = username

                flash('You are now logged in', 'success')
                return redirect(url_for('location'))
            else:
                error = 'Invalid login'
                return render_template('login.html', error=error)
            # Close connection
            cur.close()
        else:
            error = 'Username not found'
            return render_template('login.html', error=error)

    return render_template('login.html')

# Check if user logged in
def is_logged_in(f):
    @wraps(f)
    def wrap(*args, **kwargs):
        if 'logged_in' in session:
            return f(*args, **kwargs)
        else:
            flash('Unauthorized, Please login', 'danger')
            return redirect(url_for('login'))
    return wrap

# Logout
@app.route('/logout')
@is_logged_in
def logout():
    session.clear()
    flash('You are now logged out', 'success')
    return redirect(url_for('login'))

# Dashboard
@app.route('/dashboard')
@is_logged_in
def dashboard():
    # Create cursor
    cur = mysql.connection.cursor()

    # Get articles
    #result = cur.execute("SELECT * FROM articles")
    # Show articles only from the user logged in
    result = cur.execute("SELECT * FROM articles WHERE author = %s", [session['username']])

    articles = cur.fetchall()

    if result > 0:
        return render_template('dashboard.html', articles=articles)
    else:
        msg = 'No Articles Found'
        return render_template('dashboard.html', msg=msg)
    # Close connection
    cur.close()

# Article Form Class
class ArticleForm(Form):
    title = StringField('Title', [validators.Length(min=1, max=200)])
    body = TextAreaField('Body', [validators.Length(min=30)])

# Add Article
@app.route('/add_article', methods=['GET', 'POST'])
@is_logged_in
def add_article():
    form = ArticleForm(request.form)
    if request.method == 'POST' and form.validate():
        title = form.title.data
        body = form.body.data

        # Create Cursor
        cur = mysql.connection.cursor()

        # Execute
        cur.execute("INSERT INTO articles(title, body, author) VALUES(%s, %s, %s)",(title, body, session['username']))

        # Commit to DB
        mysql.connection.commit()

        #Close connection
        cur.close()

        flash('Article Created', 'success')

        return redirect(url_for('dashboard'))

    return render_template('add_article.html', form=form)


# Edit Article
@app.route('/edit_article/<string:id>', methods=['GET', 'POST'])
@is_logged_in
def edit_article(id):
    # Create cursor
    cur = mysql.connection.cursor()

    # Get article by id
    result = cur.execute("SELECT * FROM articles WHERE id = %s", [id])

    article = cur.fetchone()
    cur.close()
    # Get form
    form = ArticleForm(request.form)

    # Populate article form fields
    form.title.data = article['title']
    form.body.data = article['body']

    if request.method == 'POST' and form.validate():
        title = request.form['title']
        body = request.form['body']

        # Create Cursor
        cur = mysql.connection.cursor()
        app.logger.info(title)
        # Execute
        cur.execute ("UPDATE articles SET title=%s, body=%s WHERE id=%s",(title, body, id))
        # Commit to DB
        mysql.connection.commit()

        #Close connection
        cur.close()

        flash('Article Updated', 'success')

        return redirect(url_for('dashboard'))

    return render_template('edit_article.html', form=form)

# Delete Article
@app.route('/delete_article/<string:id>', methods=['POST'])
@is_logged_in
def delete_article(id):
    # Create cursor
    cur = mysql.connection.cursor()

    # Execute
    cur.execute("DELETE FROM articles WHERE id = %s", [id])

    # Commit to DB
    mysql.connection.commit()

    #Close connection
    cur.close()

    flash('Article Deleted', 'success')

    return redirect(url_for('dashboard'))

# Location Form Class
class LocationForm(Form):
    part_number = StringField('Part Number', [validators.Length(min=1, max=200)])
    wms = TextAreaField('WMS', [validators.Length(min=1, max=200)])
    les = TextAreaField('LES', [validators.Length(min=1, max=200)])
    cek = TextAreaField('CEK', [validators.Length(min=1, max=200)])

# Add Location
@app.route('/add_location', methods=['GET', 'POST'])
@is_logged_in
def add_location():
    form = LocationForm(request.form)
    if request.method == 'POST' and form.validate():
        part_number = form.part_number.data
        wms = form.wms.data
        les = form.les.data
        cek = form.cek.data

        # Create Cursor
        cur = mysql.connection.cursor()

        # Execute
        cur.execute("INSERT INTO coba(part_number, wms, les, cek) VALUES(%s, %s, %s, %s)",(part_number, wms, les, cek))

        # Commit to DB
        mysql.connection.commit()

        #Close connection
        cur.close()

        flash('location Created', 'success')

        return redirect(url_for('location'))

    return render_template('add_location.html', form=form)

# Edit Location
@app.route('/edit_location/<string:part_number>', methods=['GET', 'POST'])
@is_logged_in
def edit_location(part_number):
    # Create cursor
    cur = mysql.connection.cursor()

    # Get Location by part_number
    result = cur.execute("SELECT * FROM coba WHERE part_number = %s", [part_number])

    location = cur.fetchone()
    cur.close()
    # Get form
    form = LocationForm(request.form)

    # Populate location form fields
    form.wms.data = location['wms']
    form.les.data = location['les']
    form.cek.data = location['cek']
    form.part_number.data = location['part_number']

    if request.method == 'POST' and form.validate():

        wms = request.form['wms']
        les = request.form['les']
        cek = request.form['cek']
        part_number = request.form['part_number']

        # Create Cursor
        cur = mysql.connection.cursor()
        app.logger.info(wms)
        # Execute
        cur.execute("UPDATE coba SET  wms=%s, les=%s, cek=%s where part_number=%s", [wms, les, cek, part_number])
        # Commit to DB
        mysql.connection.commit()

        #Close connection
        cur.close()

        flash('Location Updated', 'success')

        return redirect(url_for('location'))

    return render_template('edit_location.html', form=form)

# Delete Location
@app.route('/delete_location/<string:part_number>', methods=['POST'])
@is_logged_in
def delete_location(part_number):
    # Create cursor
    cur = mysql.connection.cursor()

    # Execute
    cur.execute("DELETE FROM coba WHERE part_number = %s", [part_number])

    # Commit to DB
    mysql.connection.commit()

    #Close connection
    cur.close()

    flash('Location Deleted', 'success')

    return redirect(url_for('location'))

class Cek_locForm(Form):
    part_number = StringField('Part Number', [validators.Length(min=1, max=200)])
    wms = TextAreaField('WMS', [validators.Length(min=1, max=200)])
    les = TextAreaField('LES', [validators.Length(min=1, max=200)])
    cek = TextAreaField('CEK', [validators.Length(min=1, max=200)])

# Add Location
@app.route('/add_cek_loc', methods=['GET', 'POST'])
@is_logged_in
def add_cek_loc():
    form = Cek_locForm(request.form)
    if request.method == 'POST' and form.validate():
        true_cek = form.true_cek.data
        false_cek = form.false_cek.data

        # Create Cursor
        cur = mysql.connection.cursor()

        # Execute
        cur.execute("INSERT INTO cek_loc(true_cek, false_cek) VALUES(%s, %s)",(true_cek, false_cek))

        # Commit to DB
        mysql.connection.commit()

        #Close connection
        cur.close()

        flash('location Created', 'success')

        return redirect(url_for('cek_loc'))

    return render_template('add_cek_loc.html', form=form)


if __name__ == '__main__':
    app.secret_key='secret123'
    app.run(debug=True)
