angular.module("grapes.directives").directive "footer", ->
  restrict: "EA"
  template: '<div class="navbar-fixed-bottom footer">
              <ul class="nav nav-tabs">
               <li><a href="#/home">活动</a></li>
               <li><a href="#/grapes_new_activity">发布</a></li>
               <li><a href="#/grapes_user_login">朋友</a></li>
               <li><a href="#/grapes_user_console">我的</a></li>
            </ul>
            </div>'
  replace: true
