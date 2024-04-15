/*
    This is a challenge by JoseMonkey to find him. I'm playing with the Overpass Turbo API to learn it while finding him.

    What we see in this second video is an opening with a ShopRite. In the background, there is a sign that says "Dollar."
    I initially thought it was a Family Dollar, but when I started looking at logos, the actual tree seems to be blocking
    the TREE part of DOLLAR TREE (so meta). So let's just try to find ShopRites within 250 meters of Dollar Trees in the US.
    And guys, that was it.
*/
  
// Let's assume he is in the US.
area[name="United States"]->.boundary_area;

// What we want to query for is first all the Dollar Trees inside the US 
nwr(area.boundary_area)[name~"^Dollar Tree.*"];

// Then let's find ShopRite locations within 250 meters of that.
node(around:250)[name~"^ShopRite.*"];
      
(._;>;);

/* 
  Ok this returned 15 locations. So I started working the locations from top right
  to bottom left until I found ones where you could be standing at a ShopRite entrance
  with a Dollar Tree in the background.

  Some notes on this one:
    * I need to see if I can change the filter around buildings. In this case, the 
      Dollar Tree looks to be in a separate building, which I'd like to filter.
    * After finding the location though, I'm not sure that would have worked as the building
      is in an L. The location URL is: https://shorturl.at/vKTV4
    * Took about 10 minutes and it was about the 10th location I zoomed in on.
*/
out;