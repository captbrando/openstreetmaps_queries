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
area[name="United States"]->.boundary_area;

// What we want to query for is first all the Holiday Inn Variants inside the US (should be around 3K in the US)
nwr(area.boundary_area)[name~"^Holiday In.*"];

// Next let's grab any Hampton Inns within 100 meters of the Holiday Inn Variants
nwr(around:100)[name~"^Hampton In.*"];

// Finally, find all the fuel stations withi 400 meters of that.
node(around:400)[amenity="fuel"];
      
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
*/
out;