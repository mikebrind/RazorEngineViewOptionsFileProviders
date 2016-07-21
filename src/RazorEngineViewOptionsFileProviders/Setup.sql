-- Create a database and change the connection string in appsettings.json accordingly 
-- Then run this script to create the table and to populate it with the content from the default template views

CREATE TABLE [dbo].[Views](
	[Location] [nvarchar](150) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[LastModified] [datetime] NOT NULL,
    [LastRequested] [datetime]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[Views] ADD  CONSTRAINT [DF_Views_LastModified]  DEFAULT (getdate()) FOR [LastModified]
GO

INSERT [dbo].[Views] ([Location], [Content]) VALUES (N'/_viewimports.cshtml', N'@using RazorEngineViewOptionsFileProviders
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers
')
GO
INSERT [dbo].[Views] ([Location], [Content]) VALUES (N'/views/home/index.cshtml', N'@{
    ViewData["Title"] = "Home Page From Database";
}

<div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="6000">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="~/images/banner1.svg" alt="ASP.NET" class="img-responsive" />
            <div class="carousel-caption" role="option">
                <p>
                    Learn how to build ASP.NET apps that can run anywhere.
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkID=525028&clcid=0x409">
                        Learn More
                    </a>
                </p>
            </div>
        </div>
        <div class="item">
            <img src="~/images/banner2.svg" alt="Visual Studio" class="img-responsive" />
            <div class="carousel-caption" role="option">
                <p>
                    There are powerful new features in Visual Studio for building modern web apps.
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkID=525030&clcid=0x409">
                        Learn More
                    </a>
                </p>
            </div>
        </div>
        <div class="item">
            <img src="~/images/banner3.svg" alt="Package Management" class="img-responsive" />
            <div class="carousel-caption" role="option">
                <p>
                    Bring in libraries from NuGet, Bower, and npm, and automate tasks using Grunt or Gulp.
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkID=525029&clcid=0x409">
                        Learn More
                    </a>
                </p>
            </div>
        </div>
        <div class="item">
            <img src="~/images/banner4.svg" alt="Microsoft Azure" class="img-responsive" />
            <div class="carousel-caption" role="option">
                <p>
                    Learn how Microsoft''s Azure cloud platform allows you to build, deploy, and scale web apps.
                    <a class="btn btn-default" href="http://go.microsoft.com/fwlink/?LinkID=525027&clcid=0x409">
                        Learn More
                    </a>
                </p>
            </div>
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<div class="row">
    <div class="col-md-3">
        <h2>Application uses</h2>
        <ul>
            <li>Sample pages using ASP.NET Core MVC</li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=518004">Bower</a> for managing client-side libraries</li>
            <li>Theming using <a href="http://go.microsoft.com/fwlink/?LinkID=398939">Bootstrap</a></li>
        </ul>
    </div>
    <div class="col-md-3">
        <h2>How to</h2>
        <ul>
            <li><a href="http://go.microsoft.com/fwlink/?LinkID=398600">Add a Controller and View</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkID=699562">Add an appsetting in config and access it in app.</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=699315">Manage User Secrets using Secret Manager.</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=699316">Use logging to log a message.</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=699317">Add packages using NuGet.</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=699318">Add client packages using Bower.</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=699319">Target development, staging or production environment.</a></li>
        </ul>
    </div>
    <div class="col-md-3">
        <h2>Overview</h2>
        <ul>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=518008">Conceptual overview of what is ASP.NET Core</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=699320">Fundamentals of ASP.NET Core such as Startup and middleware.</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=398602">Working with Data</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkId=398603">Security</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkID=699321">Client side development</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkID=699322">Develop on different platforms</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkID=699323">Read more on the documentation site</a></li>
        </ul>
    </div>
    <div class="col-md-3">
        <h2>Run & Deploy</h2>
        <ul>
            <li><a href="http://go.microsoft.com/fwlink/?LinkID=517851">Run your app</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkID=517853">Run tools such as EF migrations and more</a></li>
            <li><a href="http://go.microsoft.com/fwlink/?LinkID=398609">Publish to Microsoft Azure Web Apps</a></li>
        </ul>
    </div>
</div>
')
GO
INSERT [dbo].[Views] ([Location], [Content]) VALUES (N'/_viewstart.cshtml', N'@{
    Layout = "_Layout";
}
')
GO
INSERT [dbo].[Views] ([Location], [Content]) VALUES (N'/views/home/contact.cshtml', N'@{
    ViewData["Title"] = "Contact";
}
<h2>@ViewData["Title"].</h2>
<h3>@ViewData["Message"]</h3>

<address>
    One Microsoft Way<br />
    Redmond, WA 98052-6399<br />
    <abbr title="Phone">P:</abbr>
    425.555.0100
</address>

<address>
    <strong>Support:</strong> <a href="mailto:Support@example.com">Support@example.com</a><br />
    <strong>Marketing:</strong> <a href="mailto:Marketing@example.com">Marketing@example.com</a>
</address>
')
GO

INSERT [dbo].[Views] ([Location], [Content]) VALUES (N'/views/shared/_layout.cshtml', N'<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>@ViewData["Title"] - RazorEngineViewOptionsFileProviders</title>

    <environment names="Development">
        <link rel="stylesheet" href="~/lib/bootstrap/dist/css/bootstrap.css" />
        <link rel="stylesheet" href="~/css/site.css" />
    </environment>
    <environment names="Staging,Production">
        <link rel="stylesheet" href="https://ajax.aspnetcdn.com/ajax/bootstrap/3.3.6/css/bootstrap.min.css"
              asp-fallback-href="~/lib/bootstrap/dist/css/bootstrap.min.css"
              asp-fallback-test-class="sr-only" asp-fallback-test-property="position" asp-fallback-test-value="absolute" />
        <link rel="stylesheet" href="~/css/site.min.css" asp-append-version="true" />
    </environment>
</head>
<body>
    <div class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a asp-area="" asp-controller="Home" asp-action="Index" class="navbar-brand">RazorEngineViewOptionsFileProviders</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li><a asp-area="" asp-controller="Home" asp-action="Index">Home</a></li>
                    <li><a asp-area="" asp-controller="Home" asp-action="About">About</a></li>
                    <li><a asp-area="" asp-controller="Home" asp-action="Contact">Contact</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="container body-content">
        @RenderBody()
        <hr />
        <footer>
            <p>&copy; 2016 - RazorEngineViewOptionsFileProviders</p>
        </footer>
    </div>

    <environment names="Development">
        <script src="~/lib/jquery/dist/jquery.js"></script>
        <script src="~/lib/bootstrap/dist/js/bootstrap.js"></script>
        <script src="~/js/site.js" asp-append-version="true"></script>
    </environment>
    <environment names="Staging,Production">
        <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-2.2.0.min.js"
                asp-fallback-src="~/lib/jquery/dist/jquery.min.js"
                asp-fallback-test="window.jQuery">
        </script>
        <script src="https://ajax.aspnetcdn.com/ajax/bootstrap/3.3.6/bootstrap.min.js"
                asp-fallback-src="~/lib/bootstrap/dist/js/bootstrap.min.js"
                asp-fallback-test="window.jQuery && window.jQuery.fn && window.jQuery.fn.modal">
        </script>
        <script src="~/js/site.min.js" asp-append-version="true"></script>
    </environment>

    @RenderSection("scripts", required: false)
</body>
</html>
')
GO
INSERT [dbo].[Views] ([Location], [Content]) VALUES (N'/views/home/about.cshtml', N'@{
    ViewData["Title"] = "About";
}
<h2>@ViewData["Title"].</h2>
<h3>@ViewData["Message"]</h3>

<p>Use this area to provide additional information.</p>
')
GO