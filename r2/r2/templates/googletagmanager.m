## The contents of this file are subject to the Common Public Attribution
## License Version 1.0. (the "License"); you may not use this file except in
## compliance with the License. You may obtain a copy of the License at
## http://code.reddit.com/LICENSE. The License is based on the Mozilla Public
## License Version 1.1, but Sections 14 and 15 have been added to cover use of
## software over a computer network and provide for limited attribution for the
## Original Developer. In addition, Exhibit A has been modified to be
## consistent with Exhibit B.
##
## Software distributed under the License is distributed on an "AS IS" basis,
## WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
## the specific language governing rights and limitations under the License.
##
## The Original Code is reddit.
##
## The Original Developer is the Initial Developer.  The Initial Developer of
## the Original Code is reddit Inc.
##
## All portions of the code written by reddit are Copyright (c) 2006-2014
## reddit Inc. All Rights Reserved.
###############################################################################

<%!
    from r2.lib.filters import scriptsafe_dumps, unsafe
    from r2.lib import js
%>

<%namespace file="utils.m" import="googletagmanager"/>

<!doctype html>
<html>
<head>
  <meta charset=utf-8>
  <meta name="referrer" content="no-referrer">
  <title></title>
</head>
<body>
  ${unsafe(js.use('gtm'))}
  <noscript>
    <iframe src="//www.googletagmanager.com/ns.html?id=${thing.container_id}"
    height="0" width="0" style="display:none;visibility:hidden"></iframe>
  </noscript>
  <script>
    try {
      var bootstrap = JSON.parse(window.name);
      if (bootstrap) {
        window.googleTagManager = [bootstrap];
      }
    } catch (e) {}
    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
    '//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
    })(window,document,'script','googleTagManager',${scriptsafe_dumps(thing.container_id)});
  </script>
</body>
</html>
