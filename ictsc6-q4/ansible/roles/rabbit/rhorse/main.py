from bottle import request, route, template, post, static_file, error
import bottle

@route('/')
def jump():
    bottle.redirect("/index.sh", 301)

@route('/index.sh')
def index():
    return flist(1)

@route('/index.sh/page/<page>')
def flist(page=1):
    return template("index", page=int(page))

@route('/get/<file_name>')
def get(file_name=None):
    return static_file(file_name, root="/horse/data/", download=True) if file_name is not None else "Download ERR!"

@post('/upload.sh')
def up():
    try:
        request.files.get('file', '').save("/horse/data/")
    except:
        return "Upload Error! Couldn\'t save.<br><a href=/>Go to top</a>"
    return 'Upload OK.<br><a href=/>Go to top</a>'

@error(404)
@error(500)
def err(i):
    return "SERVER ERROR!"


bottle.run(host='0.0.0.0', port=80, debug=False, reloader=False)
