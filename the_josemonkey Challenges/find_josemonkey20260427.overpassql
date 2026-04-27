/*
    This is a challenge by JoseMonkey to find him. I'm playing with the Overpass Turbo API to learn it while finding him.

    In the video, he is standing in in a parking lot near a some building that looks like an old Hampton Inn. 
    The building has the frame of the logo and looks like the drive up part of the hotel, but the branding is missing.
    In the parking lot is a truck with a McClane Trucking logo on the side. I see cars in the parking lot on the side,
    one is a white truck towing a UHaul trailer. License plates are too small to read, but there are plates on the
    front of the cars. They are white. I also see palm trees.
        
    Then, you can see what looks like a BP gas station in the distance but I wasn't sure with the branding so I kept that
    part of the query generic. But that's pretty much it. The license plates are front and back on the cars, plain, but 
    too blurry to see. The piece that got me there was when I rewatched, you see a water tower close to the hotel that I
    missed initially. And guys, that was it!
*/
  
// We will assume he is in the United States based on the McClane Trucking logo, and also in a place with palm trees.
(
  area["ISO3166-2"="US-FL"];
  area["ISO3166-2"="US-TX"];
  area["ISO3166-2"="US-LA"];
  area["ISO3166-2"="US-MS"];
  area["ISO3166-2"="US-AL"];
  area["ISO3166-2"="US-GA"];
  area["ISO3166-2"="US-SC"];
  area["ISO3166-2"="US-CA"];
  area["ISO3166-2"="US-AZ"];
  area["ISO3166-2"="US-NV"];
  area["ISO3166-2"="US-HI"];
)->.boundary_area;

// Now we can clearly see a Waffle House in the video, so let's use that as a starting point.
//nwr(area.boundary_area)[name~"^Waffle Hous.*"];
nwr(area.boundary_area)["amenity"="restaurant"]["brand"="Waffle House"];

// Next let's grab any Gas Stations within 150 meters of Waffle Houses
nwr(around:150)["amenity"="fuel"];

// Finally, find all the hotels within 300 meters of that since we dont know the brand.
node(around:300)["tourism"="hotel"];

// LAST ONE, add in nearby water towers.
node(around:300)["man_made"="water_tower"];
      
(._;>;);
out;

/* 
  Ok this finally refined query only returned 2 results, and it was the first one I checked.
  I went through several iterations of this looking for BP stations, but that was the big 
  holdup. I think the main issue for me was the fact that I couldn't just the distance.
  Finding this place was a little bit of luck because the fuel station found in the query
  was not a BP station, but on the other side. So 

  Some notes on this one:
    * Had he been standing slightly farther from the awning, I might have been able
      to see the Best Western logo. It was literally above his head but the awning 
      blocked it.
    * The trucking company was definitely great for picking the country.
    * What really helped was seeing the Waffle House by a Hotel lobby. Not knowing
      what hotel chain slowed things down a bit.
    * Altering the distance for the gas station (450) & adding the brand to the query I got
      only one result: nwr(around:450)["amenity"="fuel"]["brand"="BP"];
    * Jose was standing at these coordinates: 32.631662, -80.875894, in front of the Best Western
      Point South in Yemassee, South Carolina. Google thinks it is temporarily closed.
*/