<%@ Page Title="Contact" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.vb" Inherits="VbWebFormsAppWithWebApi.Contact" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <script type="text/javascript">
        'use strict';

        function getProducts() {
            const products = $('#products');

            $.getJSON("api/products", data => {
                products.empty();

                    $.each(data, (key, val) => {
                        let row = `<tr><td>${val.Name}</td><td>${val.Price}</td></tr>`;

                        products.append($(row));
                    });
                });
        }

        $(document).ready(getProducts);
    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>Products</h2>
    <table>
    <thead>
        <tr><th>Name</th><th>Price</th></tr>
    </thead>
    <tbody id="products">
    </tbody>
    </table>
</asp:Content>
