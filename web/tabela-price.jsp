<%-- 
    Document   : tabela-price
    Created on : 08/09/2017, 15:45:37
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        <h1>Gerador de Tabela Price</h1>
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
        <form>
           Divida a ser paga: <input type='number' step='0.01' min='1' name = 'divida' value = '<%=divida%>'/><br/>
           Juros: <input type='number' step='0.01' min='1' name = 'juros' value = '<%=juros%>'/><br/>
           Tempo*: <input type='number' step='0.01' min='1' name = 'tempo' value = '<%=tempo%>'/><br/>
           <input type='submit' value ='Gerar'/>
        </form>
           <table border='1'>
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
               parcelaShow = parcela;
               jurosP = indiceJ * divida;
               amortizacao = parcela - jurosP;
               divida = divida - amortizacao;
               }
           %> 
           </table>
    </body>
</html>
