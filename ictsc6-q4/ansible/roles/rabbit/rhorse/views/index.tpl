<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>らびっとほーす</title>
</head>
<body>
<div id="base">
    <div id="base2">
        <div id="upload">
            <form action="/upload.sh" method="post" enctype="multipart/form-data">
                <a>アップロードする</a><br>
                <input type="file" name="file" size="30"/><br/>
                <br/>
                <input type="submit" value="アップロード"/>
            </form>
        </div>
        <hr>
        <div id="uploaded">
<%
import os
page -= 1
out = ['<a href="/get/' + i + '">ファイル名: ' + i + '</a><br><br>' for i in sorted(os.listdir('/horse/data/'),key=lambda x: os.path.getctime('/horse/data/' + x),reverse=1)[page*50:page*50+50]]
out.append('<button onclick=location.href="/index.sh/page/' + str(page+2) + '">次ページ</button><br>' if len(sorted(os.listdir('/horse/data/'),key=lambda x: os.path.getctime('/horse/data/' + x),reverse=1)) > (page+1) * 50 else "")
out.append('<button onclick=location.href="/index.sh/page/' + str(page) + '">前ページ</button><br>' if page > 0 else "")
%>
        <% for i in out: %>
            {{!i}}
        </div>
    </div>
</div>
</body>
</html>