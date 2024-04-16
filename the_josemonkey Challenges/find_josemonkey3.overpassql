/*
    This is a challenge by JoseMonkey to find him. I'm playing with the Overpass Turbo API to learn it while finding him.

    In the video, he is clearly standing in in a parking lot near a Hampton Inn. The logo and sign are blurry but recognizable.
    The next artifact is another hotel that has a blue neon logo. There are a number of options here, so just gotta get searching.
    
    It is a Holiday Inn Express.
    
    Then, you can see what looks like a gas station in the distance with some prices on a sign.
    But that's pretty much it. The license plates are front and back on the cars, plain, but too blurry to see.
*/
  
// Let's assume he is in the US.
//[bbox:22.1, -122.9, 46.2, -49.9]; // <-- this is the old way
// area[name="United States"]->.boundary_area; // <-- disregarded for poly.

// What we want to query for is first all the Holiday Inn Variants inside the US (should be around 3K in the US)
//nwr(area.boundary_area)[name~"^Holiday In.*"]; // <-- this is if we stuck to the area above.

/* 
    Ok new way. Let's do a polygon. We're goign to try by catching the cross into the US west of Del Rio, 
    then go north east to st louis, then continuing on to try to match the arc as best as possible.
*/
nwr(poly:"29.56005 -101.24596 38.64749 -90.18076 43.89516 -78.80089 47.05535 -67.77745 45.60329 -67.4409 42.97244 -76.05393 38.38832 -85.91413 33.23460 -94.04559 27.97923 -99.93031")[name~"^Holiday In.*"];

// Next let's grab any Hampton Inns within 100 meters of the Holiday Inn Variants
nwr(around:100)[name~"^Hampton In.*"];

// Finally, find all the fuel stations withi 400 meters of that.
//node(around:400)[amenity="fuel"]; // <-- See below, this was by luck and not in the video.
      
(._;>;);

/* 
  Ok this returned about 100 fuel stations. Now here's where the confession comes in.
  His actual video has what looks like the fuel station sign, but after seeing someone post
  a comment that has his location, I validated that my query found it, which it did.
  But the problem is you cannot see the fuel station from his vantage point. It's across
  the road.

  Some notes on this one:
    * Both hotels were listed as WAYS not NODES, which I have found in other searches
      too, and that seems wrong to me. The gas station was a node.
    * The street view is not up to date as the commercial building behind the Hampton
      Inn is shown under construction, and OpenStreetMap doesn't even have it included.
    * I thought the license plates would be helpful, but limiting the query to those
      22 states would not have helped. New York does not mandate front license plate.
    * I could have used the map-based bounding box (not pre-defining) for scrolling
      around, but I liked the larger show me all the things view.
    * I set a boundary area of the United States, but I could do by state like
      this: nwr[name~"^Holiday In.*"]["addr:state"="NY"];
    * I just went back and tried the Poly method to limit the results of the first two 
      items we could clearly see in the video to a polygon roughly showing where totality
      would be (based on his commentary in the video). That gave us 20 results, muchy
      more manageable.
*/
out;