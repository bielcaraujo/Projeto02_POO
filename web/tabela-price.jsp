<%-- 
    Document   : tabela-price
    Created on : 08/09/2017, 15:45:37
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <%@include file="WEB-INF/jspf/header.jspf" %>
    <%@include file="WEB-INF/jspf/menu.jspf" %>
    <body>
        <br/><br/><br/><br/><br/><br/><h1>Gerador de Tabela Price</h1>
        <hr/>
        <%
            //inicialização das variaveis
            double divida = 0;
            double juros = 0;
            int tempo = 0;
            //tratamento de erro da variavel divida
            try{
                if(request.getParameter("divida")!= null){
                divida = Double.parseDouble(request.getParameter("divida"));
                }
            }
            catch(Exception ex){
                out.println("<span style='color:red;'>Você entrou com um número no formato inválido no campo de Divida. Tente novamente: </span><br>");
            }
            //tratamento de erro da variavel juros
            try{
                if(request.getParameter("juros")!= null){
                juros = Double.parseDouble(request.getParameter("juros"));
                }
            }
            catch(Exception ex){
                out.println("<span style='color:red;'>Você entrou com um número no formato inválido no campo de Juros. Tente novamente: </span><br>");
            }
            //tratamento de erro da variavel tempo
            try{
                if(request.getParameter("tempo")!= null){
                tempo = Integer.parseInt(request.getParameter("tempo"));
                }
            }
            catch(Exception ex){
                out.println("<span style='color:red;'>Você entrou com um número no formato inválido no campo de Tempo. Tente novamente: </span><br>");
            }
        %>
        <br/><br/><center><form>
           <h5>Divida:</h5> <input type='number' step='0.01' min='1' name = 'divida' value = '<%=divida%>'/><br/>
           <h5>Juros:</h5> <input type='number' step='0.01' min='1' name = 'juros' value = '<%=juros%>'/><br/>
           <h5>Tempo*:</h5> <input type='number' step='0.01' min='1' name = 'tempo' value = '<%=tempo%>'/><br/>
           <h6>*Tempo em meses</h6>
           <input type='submit' value ='Gerar'/><br/>
        </form></center>
           <table border='1'class="table table-striped table-bordered table-hover">
               <tr>
                   <th>Período<hr></th>
                   <th>Amortização<hr></th>
                   <th>Parcela<hr></th>
                   <th>Juros<hr></th>
                   <th>Divida<hr></th>
               </tr>
           <%
               DecimalFormat arredonda = new DecimalFormat ("#.00");
               double indiceJ = juros/100;
               double parcela = divida*(Math.pow((1+indiceJ),tempo)*indiceJ)/((Math.pow((1+indiceJ),tempo))-1);
               double amortizacao = 0;
               double jurosP = 0;
               double parcelaShow = 0;
               double totalA = 0;
               double totalP = 0;
               double totalJ = 0;
               for(int i=0;i<=tempo;i++){
           %>
            <tr>
                <td><%=i%><hr></td>
                <td><%=arredonda.format(amortizacao)%><hr></td>
                <td><%=arredonda.format(parcelaShow)%><hr></td>
                <td><%=arredonda.format(jurosP)%><hr></td>
                <td><%=arredonda.format(divida)%><hr></td>
            </tr>
           <%
               jurosP = indiceJ * divida;
               totalA = amortizacao + totalA;
               totalP = parcelaShow + totalP;
               totalJ = jurosP + totalJ;
               parcelaShow = parcela;
               amortizacao = parcela - jurosP;
               divida = divida - amortizacao;
             %> 
             <%if(i == tempo){%>
                <tr>
                <td>Total</td>    
                <td><%=arredonda.format(totalA)%><hr></td>
                <td><%=arredonda.format(totalP)%><hr></td>
                <td><%=arredonda.format(totalJ)%><hr></td>
                <td>-<hr></td>
                </tr>
                <%}
                }%>
           </table>
    <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
