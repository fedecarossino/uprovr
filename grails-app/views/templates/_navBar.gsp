    <div class="navbar-wrapper" style="margin-top: 0px;position: fixed;">
      <div class="container" style="padding: 0px;width: 100%;">

        <div class="navbar navbar-inverse navbar-static-top" role="navigation">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="/">UPROVR</a>
            </div>
       	 	<form action="/search/">
	          	 <div class="input-group search">
			          <input type="text" class="form-control" name="textSearch">
			          <span class="input-group-btn">
			            <button class="btn btn-default" type="submit">Buscar</button>
			          </span>
		        </div>
       	 	</form>
            <div class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li class="dropdown">
<%--                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Categorias <b class="caret"></b></a>--%>
<%--                  <ul class="dropdown-menu">--%>
<%--                    <li class="dropdown-header">Tecnologia</li>--%>
<%--                    <li><a href="/category/camaras">Camaras</a></li>--%>
<%--                    <li><a href="/category/celulares">Celulares</a></li>--%>
<%--                    <li><a href="/category/notebooks">Notebooks</a></li>--%>
<%--                    <li><a href="/category/tablets">Tablets</a></li>--%>
<%--                    <li><a href="/category/tablets">Consolas</a></li>--%>
<%--                    <li><a href="/category/tv">TV</a></li>--%>
<%--                    <li class="divider"></li>--%>
<%--                    <li class="dropdown-header">Instrumentos Medicina</li>--%>
<%--                    <li><a href="#">Paraloscopia</a></li>--%>
<%--                  </ul>--%>

                <li><a href="" onclick="document.cookie = 'upsite=';window.location='/uprovr'" data-toggle="modal" data-target=".bs-example-modal-sm">Top Battles</a></li>
                </li>
              </ul>
            </div>
          </div>
        </div>

      </div>
    </div>
