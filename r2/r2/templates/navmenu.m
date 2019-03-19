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
## All portions of the code written by reddit are Copyright (c) 2006-2015
## reddit Inc. All Rights Reserved.
###############################################################################

<%namespace file="utils.m" import="plain_link, post_link, img_link, separator"/>

<%def name="dropdown()">
  ## caching comment:
  ##  see caching comment for plain_link.  In addition to the args, 
  ##  this function depends on c.site.name and c.render_style
  <% css_class = str(thing.css_class) if thing.css_class else "" %>
  %if thing:
    %if thing.title and thing.selected:
      <span class="dropdown-title ${css_class}">${thing.title}:&#32;</span>
    %endif

    <div class="dropdown ${css_class}"
         ${"id='%s'" % thing._id if thing._id else ""}
         onclick="open_menu(this)">
 
      %if thing.selected:
          <span class="selected">${thing.selected.selected_title()}</span>
      %elif thing.title:
          <span class="selected title">${thing.title}</span>
      %endif
    </div>

    <div class="drop-choices ${css_class}">
      %for option in thing:
        %if option != thing.selected:
          ${option}
        %endif
      %endfor
    </div>

  %endif
</%def>


<%def name="flatlist()">
  <% css_class = str(thing.css_class) if thing.css_class else "" %>
  %if thing:
    <ul class="${css_class} hover"
        ${"id='%s'" % thing._id if thing._id else ""}>

      %if thing.title:
        <li class="${css_class} title">${thing.title}</li>
      %endif

      %for i, option in enumerate(thing):
        <%
           ##option.title isn't the title, option.render() is the entire link
           if option == thing.selected:
             class_name = "class='selected'"
             option.selected = True                                           
           else:
             class_name = ""
        %>
        <li ${class_name}>
          %if i > 0:
            ${separator(thing.separator)}
          %endif
          ${option}
        </li>
      %endfor
    </ul>
  %endif
</%def>


<%def name="tabmenu()">
  %if thing:
    <% css_class = str(thing.css_class) if thing.css_class else "" %>
    <ul class="tabmenu ${css_class}"
        ${"id='%s'" % thing._id if thing._id else ""}>
      %for i, option in enumerate(thing):
        <%
           tab_name = getattr(option, 'tab_name', None)
           li_id = "id='tab-%s'" % tab_name if tab_name else ""
           li_class = "class='selected'" if option == thing.selected else ""
        %>
        <li ${li_id} ${li_class}>
          ${option}
        </li>
      %endfor
    </ul>
  %endif
</%def>