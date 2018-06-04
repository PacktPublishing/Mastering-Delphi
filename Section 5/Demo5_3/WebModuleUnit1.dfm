object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      Producer = PageProducer1
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object PageProducer1: TPageProducer
    HTMLDoc.Strings = (
      '<!DOCTYPE html>'
      '<html>'
      '<head>'
      ''
      '<!-- your webpage info goes here -->'
      ''
      '    <title>My First Website</title>'
      #9
      #9'<meta name="author" content="your name" />'
      #9'<meta name="description" content="" />'
      ''
      
        '<!-- you should always add your stylesheet (css) in the head tag' +
        ' so that it starts loading before the page html is being display' +
        'ed -->'#9
      #9'<link rel="stylesheet" href="style.css" type="text/css" />'
      #9
      '</head>'
      '<body>'
      ''
      '<!-- webpage content goes here in the body -->'
      ''
      #9'<div id="page">'
      #9#9'<div id="logo">'
      #9#9#9'<h1><a href="/" id="logoLink">My First Website</a></h1>'
      #9#9'</div>'
      #9#9'<div id="nav">'
      #9#9#9'<ul>'
      #9#9#9#9'<li><a href="#/home.html">Home</a></li>'
      #9#9#9#9'<li><a href="#/about.html">About</a></li>'
      #9#9#9#9'<li><a href="#/contact.html">Contact</a></li>'
      #9#9#9'</ul>'#9
      #9#9'</div>'
      #9#9'<div id="content">'
      #9#9#9'<h2>Home</h2>'
      #9#9#9'<p>'
      
        #9#9#9#9'This is my first webpage! I was able to code all the HTML an' +
        'd CSS in order to make it. Watch out world of web design here I ' +
        'come!'
      #9#9#9'</p>'
      #9#9#9'<p> '
      
        #9#9#9#9'I can use my skills here to create websites for my business,' +
        ' my friends and family, my C.V, blog or articles. As well as any' +
        ' games or more experiment stuff (which is what the web is really' +
        ' all about). '
      #9#9#9'</p>'
      #9#9'</div>'
      #9#9'<div id="footer">'
      #9#9#9'<p>'
      #9#9#9#9'Webpage made by <a href="/" target="_blank"><#Myname></a>'
      #9#9#9'</p>'
      #9#9'</div>'
      #9'</div>'
      '</body>'
      '</html>')
    OnHTMLTag = PageProducer1HTMLTag
    Left = 192
    Top = 96
  end
end
