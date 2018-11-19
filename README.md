# CFQuery using cachedAfter attribute

This demonstrates how the cachedAfter attribute works in Adobe ColdFusion 2016 and Lucee 5.2+. The code is designed to run easily using CommandBox <https://www.ortussolutions.com/products/commandbox>.

## ColdFusion

To start the ColdFusion server with CommandBox, open a terminal or command prompt window to the folder where this repository has been downloaded. Assuming you have placed the CommandBox executable in your system path, type:

```bash
box server start cfquery_cachedafter_acf
```

This repository includes an Apache Derby database that ColdFusion will run in memory when the application starts.

## Lucee

To start the Lucee server with CommandBox, open a terminal or command prompt window to the folder where this repository has been downloaded. Assuming you have placed the CommandBox executable in your system path, type:

```bash
box server start cfquery_cachedafter_lucee
```

This repository includes an H2 database that Lucee can run in memory when the application starts. The H2 database driver does not come pre-installed with the Lucee 5.x software. It is an extension that can be added to Lucee. To do this, start the Lucee server. This will almost certainly throw an error - ignore that for now. Open the Lucee server admin (there should be a Lucee icon in your Windows task tray or the Mac equivalent) - right click on the icon, then click on Open->Server Admin. Log in to the admin interface (create a password if prompted). In the left-hand navigation pane, click on Extension->Applications heading, and click on the H2 Datasource tile in the "Not installed" section. Follow the prompts to complete the extension installation.
