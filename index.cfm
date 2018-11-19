<cfdump var="#application#">
<cfif NOT application.keyExists( "cachedAfterTime" )>
    <cfset application.cachedAfterTime = dateAdd( "s", 5, now() )>
</cfif>

<cfquery name="getMovies" cachedafter="#application.cachedAfterTime#">
    SELECT  MovieId
            ,Title
            ,Rating
            ,ReleaseYear
            ,PlotSummary
    FROM tMovies
    WHERE MovieId <= 5
</cfquery>

<cfdump var="#getMovies#">