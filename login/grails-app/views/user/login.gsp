<html>
  <head>
    <meta name="layout" content="main" />
    <title>Login</title>         
  </head>
  <body>
    <div class="body">
      <h1>Login</h1>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="authenticate" method="post" >
        <div class="dialog">
          <table>
            <tbody>            
              <tr>
                <td>
                  <label>Login:</label>
                </td>
                <td>
                  <input type="text" id="nombreUsuario" name="nombreUsuario"/>
                </td>
              </tr> 
          
              <tr>
                <td>
                  <label>Password:</label>
                </td>
                <td>
                  <input type="password" id="contrasenia" name="contrasenia"/>
                </td>
              </tr> 
            </tbody>
          </table>
        </div>
        <div class="buttons">
          <span class="button">
            <input class="save" type="submit" value="Login" />
          </span>
        </div>
      </g:form>
    </div>
  </body>
</html>