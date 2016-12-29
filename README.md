Developement environemnt:<br />
1. SQL Server 2014<br />
2. use windows authentication to log on SQL server 2014<br />
3. IIS 7.5 to create website to Umbraco-CMS-release-7.5.6\src\Umbraco.Web.UI folder<br />
4. Merge https://our.umbraco.org/download to Umbraco-CMS-release-7.5.6\src\Umbraco.Web.UI folder<br />
<br />
I figured it out with following steps.<br />
1. convert Sql ce to sql query file using &quot;ExportSQLCE40.exe &quot;Data Source=umbraco.sdf;&quot; umbraco.sql&quot;<br />
download from http://exportsqlce.codeplex.com/downloads/get/160019<br />
2. check your applicaiotn pool Identity <br />
right click application pool and repalce default account with windows account that has sql permision<br />
3. Replace SQL connection with SQL Server connection<br />
	&lt;/appSettings&gt;<br />
	&lt;connectionStrings&gt;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&lt;add name=&quot;umbracoDbDSN&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;providerName=&quot;System.Data.SqlClient&quot;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;connectionString=&quot;Data Source=localhost;Initial Catalog=Umbraco;Integrated Security=True;MultipleActiveResultSets=True&quot; /&gt;<br />
&nbsp;&nbsp;&lt;/connectionStrings&gt;<br />
4. find a bug in code src\Umbraco.Core\Persistence\PetaPoco.cs<br />
&quot;else if (dbtype.StartsWith(&quot;SqlClient&quot;)) _dbType = DBType.SqlServer; &quot; was missed.<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if (dbtype.StartsWith(&quot;MySql&quot;)) _dbType = DBType.MySql;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else if (dbtype.StartsWith(&quot;SqlCe&quot;)) _dbType = DBType.SqlServerCE;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else if (dbtype.StartsWith(&quot;Npgsql&quot;)) _dbType = DBType.PostgreSQL;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else if (dbtype.StartsWith(&quot;Oracle&quot;)) _dbType = DBType.Oracle;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else if (dbtype.StartsWith(&quot;SQLite&quot;)) _dbType = DBType.SQLite;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;else if (dbtype.StartsWith(&quot;SqlClient&quot;)) _dbType = DBType.SqlServer; <br />
<br />
5. Now my first umbarco website works fine.<br />
