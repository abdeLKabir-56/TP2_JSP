<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Gestion Commande</title>
     <link rel="stylesheet" href="facture.css">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>

<%! 
    
String row(String description, String name) {
        String row;
        row = "<tr>" +
                "<td>" + description + "</td>" +
                "<td><input type='text' id='" + name + "' name='" + name + "Qte' class='form-control' required></td>" +
                "<td><input type='text' id='" + name + "' name='" + name + "PrixUnit' class='form-control' required></td>" +
                "<td><input type='text' id='" + name + "' name='" + name + "Total' class='form-control' disabled></td>" +
              "</tr>";
        return row;
    }
%>
<div class="container">
<h1>Facture</h1>
<form action="facture.jsp" method="POST">
  <div class="footer">
            <table>
              <tr>
                <td>Facture N°:</td>
                    <td><input type="text" id="nomCLient" name="Facturenum" class="form-control" ></td>
            </tr>
            <tr>
                <td>Nom Client:</td>
                    <td><input type="text" id="nomCLient" name="nomClient" class="form-control" ></td>
            </tr>
            <tr>
                <td>Adresse Client:</td>
                    <td><input type="text" id="adresseCLient" name="adresseClient" class="form-control"></td>
            </tr>
            <tr>
                <td>Email Client:</td>
                    <td><input type="text" id="emailCLient" name="emailClient" class="form-control" ></td>
            </tr>
            </table>
        </div>
        <table>
            <thead>
                <th>Description</th>
                <th>Qty</th>
                <th>Unit Price</th>
                <th>Total HT</th>
            </thead>
            <tbody>
                <%=row("Laptop, Macbook Pro M2", "Laptop") %>
                <%=row("Printer Hp Pro 7740", "Printer") %>
                <%=row("SSD 500GB", "SSD") %>
                <tr>
                    <td rowspan="4" colspan="2" class="conditions">
                        <b>Payment Conditions</b>
                        <p>Les modes de paiement acceptés incluent le chèque ,le virement bancaire et la carte crédit</p>
                    </td>
                    <td>Total net HT</td>
                    <td><input type="text" id="totalNet" name="totalNet" class="form-control" disabled></td>
                </tr>
                <tr>
                    <td>TVA</td>
                    <td><input type="text" id="tva" name="tva" class="form-control" disabled></td>
                </tr>
                <tr>
                    <td>Discount</td>
                    <td><input type="text" id="discount" name="discount" class="form-control" disabled></td>
                </tr>
                <tr>
                    <td class="total"><b>Total TTC:</b></td>
                    <td><input type="text" id="totalTtc" name="totalTtc" class="form-control" disabled></td>
                </tr>
            </tbody>
        </table>
        <button type="submit">Calculate</button>
      
    </form>
</div>

</body>
</html>
