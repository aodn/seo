## HTML generation

Ensure URLs and various other config variables are set correctly (geonetwork url etc) in [src/records-process.xml](src/records-process.xml).  Then,

```
$ ./run.sh
```

Generated HTML will be written to [output](output).


##TODO

	* sort records before processing to create predictable order for index page
	* create 1px image link, or white styled div on portal page to funnel from main portal
	* why are directories being created?
    * human text on index page, describing what the data collections are
	* fix map image to use extents BBX from the metadata record
	* emii image is not current according to Phil
	

