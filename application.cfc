component {
    variables.curPath = Replace( GetDirectoryFromPath( GetCurrentTemplatePath() ), "\", "/", "ALL");

    this.name = "CFQuery_CachedAfter_Test";
    this.applicationTimeout = CreateTimeSpan( 1, 0, 0, 0 );
    if ( server.coldfusion.productname IS "ColdFusion Server" ) {
        variables.dbPath = variables.curPath & 'database/Derby/';
        this.datasources = {
            Movies = {
                url = "jdbc:derby:#variables.dbPath#;create=true;MaxPooledStatements=300", 
                driver = "Apache Derby Embedded"
            }
        };
        this.passArrayByReference = true;
    }
    else {
        variables.dbPath = variables.curPath & 'database/H2/';
        this.datasources = {
            Movies = {
                class: 'org.h2.Driver'
                ,bundleName: 'org.h2'
                ,bundleVersion: '1.3.172'
                ,connectionString: 'jdbc:h2:#variables.dbPath#Movies;MODE=HSQLDB'
                , username: 'sa'
                , password: "encrypted:88ea8e6a312110ea98e33873b1127c0da2620ce60aa9be2620c7a3fe1b7963a4"
                // optional settings
                , connectionLimit:100 // default:-1
            }
        };
    }
    this.datasource = 'Movies';

    public boolean function onApplicationStart() {
        return true;
    }

    public void function onRequest(required string targetPage) {
        if ( !DirectoryExists( variables.dbPath ) ) {
            include "/database/buildDB.cfm";
            location("/", "false");
        }
        else {
            include arguments.targetPage;
        }
        return;
    }

}