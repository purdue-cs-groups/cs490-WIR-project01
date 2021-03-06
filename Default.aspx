﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TuneRank.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>TuneRank</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <link rel="stylesheet" href="Content/css/bootstrap.css" />
    <link rel="stylesheet" href="Content/css/bootstrap-responsive.css" />
    <style type="text/css">
        body {
            padding-top: 20px;
            padding-bottom: 40px;
        }

        .jumbotron {
            margin: 40px 0 60px 0;
            text-align: left;
        }

            .jumbotron h1 {
                font-size: 72px;
                line-height: 1;
            }

            .jumbotron .btn {
                font-size: 21px;
                padding: 14px 24px;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="jumbotron">
                <a href="/">
                    <h1>TuneRank</h1>
                </a>
                <br />
                <p class="lead">Lyric analysis of the Billboard Top 100 chart</p>
            </div>

            <hr />

            <div class="row">
                <h2>Top Love Songs</h2>
                <br />
                <asp:Literal ID="litLoveSongs" runat="server" />
            </div>
            <br />

            <hr />

            <div class="row">
                <h2>Happiest Songs</h2>
                <br />
                <asp:Literal ID="litHappy" runat="server" />
            </div>
            <br />

            <hr />

            <div class="row">
                <h2>Saddest Songs</h2>
                <br />
                <asp:Literal ID="litSad" runat="server" />
            </div>
            <br />

            <hr />

            <div class="row">
                <h2>Most Profane Songs</h2>
                <br />
                <asp:Literal ID="litProfaneSongs" runat="server" />
            </div>
            <br />

            <hr />

            <div class="row">
                <h2>Most Repetitive Songs</h2>
                <br />
                <asp:Literal ID="litRepetitiveSongs" runat="server" />
            </div>
            <br />

            <hr />

            <footer>
                <p>Built by <a href="http://twitter.com/mbmccormick" target="_blank">@mbmccormick</a> and <a href="http://twitter.com/martellaj" target="_blank">@martellaj</a></p>
            </footer>

        </div>

        <script src="/Content/js/jquery.js"></script>
        <script src="/Content/js/bootstrap.js"></script>
    </form>
</body>
</html>
