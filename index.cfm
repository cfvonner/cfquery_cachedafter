<cfdump var="#application#">
<cfif NOT application.keyExists( "cachedAfterTime" )>
    <cfset application.cachedAfterTime = dateAdd( "s", 15, now() )>
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

<cfset randomNumber = floor( rand( 'SHA1PRNG' ) * 5 )>
<cfquery name="getRandomMovieAfter" cachedafter="#application.cachedAfterTime#">
    SELECT  MovieId
            ,Title
            ,Rating
            ,ReleaseYear
            ,PlotSummary
    FROM tMovies
    WHERE MovieId = <cfqueryparam value=#randomNumber# cfsqltype="integer">
</cfquery>

<cfquery name="getRandomMovieWithin" cachedwithin="#createTimespan(0,0,1,0)#">
    SELECT  MovieId
            ,Title
            ,Rating
            ,ReleaseYear
            ,PlotSummary AS Summary
    FROM tMovies
    WHERE MovieId = <cfqueryparam value=#randomNumber# cfsqltype="integer">
</cfquery>


<cfdump var="#getMovies#">
<cfdump var="#getRandomMovieAfter#">
<cfdump var="#getRandomMovieWithin#">