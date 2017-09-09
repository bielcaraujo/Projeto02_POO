<%-- 
    Document   : home
    Created on : 08/09/2017, 15:44:55
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <body>
    <header class="masthead">
      <div class="container">


        <div class="intro-text">
          <span class="name">Equipe</span>
          <hr class="star-light">
        <div class="row">
        <div class="col-lg-6">
          <img class="img-fluid rounded circle" width="50%" src="res/img/Gabriel.jpg" alt="">
          <h4 class="text-center">Gabriel Colombo</h4>
        </div>
        <div class="col-lg-6">
          <img class="img-fluid rounded circle" width="50%" src="res/img/João.jpg" alt="">
          <h4 class="text-center">João Victor Sebastian</h4>
        </div>
          </div>
        </div>
      </div>
    </header>
    <section class="success" id="about">
      <div class="container">
        <h2 class="text-center">Sobre Amortização</h2>
        <hr class="star-light">
        <div class="row">
          <div class="col-lg-4 ml-auto">
            <p>Amortização é um processo de extinção de uma dívida através de pagamentos periódicos, que são realizados em função de um planejamento, de modo que cada prestação corresponde à soma do reembolso do capital ou do pagamento dos juros do saldo devedor, podendo ser o reembolso de ambos, sendo que os juros são sempre calculados sobre o saldo devedor.</p>
          </div>
          <div class="col-lg-4 mr-auto">
            <p>No Brasil, existe amortização contábil, cujo conceito não se restringe à diminuição de dívidas, mas também a direitos intangíveis classificados no ativo (conta de balanço), derivado da teoria de dimensão econômico dos fundos contábeis. Assim, associa-se o termo amortização contábil, à depreciação contábil (redução de bens tangíveis) e à exaustão contábil (recursos naturais).</p>
          </div>
          <div class="col-lg-8 mx-auto text-center">
          </div>
        </div>
      </div>
    </section>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
