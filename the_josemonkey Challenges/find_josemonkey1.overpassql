/*
    This is a challenge by JoseMonkey to find him. I'm playing with the Overpass Turbo API to learn it while finding him.

    What we see in this first video opens pointing at a road, there is a speed bump in front of the location.
    Then we see some busses that are shorter, but still relevant. And we also see a long coach with a company
    name on it, but I am not sure that would be useful as they go all over the US.
    
    We are again, assuming US.
    
    There is a small white sign on the walkway with blue highlighted letters. Looks like two or three lines
    of text. 

    Then he raises the camera to a sign that sais "The Kenn..." which makes me think this could be related
    to John F Kennedy. Maybe his presidential library or a monument? The logo looks kinda like a boot or bridge
    or building. So maybe not.

    Then we see a little bit of the building. It has what looks like text of ...MING ARTS. I'm filling in the
    ARTS because all we really see is A_TS. SO maybe a performing arts center?

    So I started googling around, and didn't even need OpenStreetMaps to find it. I asked Googz if there was
    a kennedy memorial near a performing arts center, and the first hit had the logo that we saw in the sign.
    
    And guys, that was it.
*/
  
// Let's assume he is in the US.
area[name="United States"]->.boundary_area;

// We want to find any location that has both the word Kennedy in it as well as Performing Arts
nwr(area.boundary_area)[name~"Kennedy"][name~"Performing Arts"];

// returns ONE location.
(._;>;);

/* 
  So let's reverse our way into this. Even though I didn't need the scripts, let's build them based on what
  we know to be true. Let's look for a building that has kennedy and performing arts in the title.

  Some notes on this one:
    * This one was pretty easy based on my brain filling in the blanks. Took about 3 mins.
    * Here's the location: https://shorturl.at/qvxU5
*/
out;