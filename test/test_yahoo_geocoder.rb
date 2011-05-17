require File.join(File.dirname(__FILE__), 'test_base_geocoder')

Geokit::Geocoders::yahoo = 'Yahoo'

class YahooGeocoderTest < BaseGeocoderTest #:nodoc: all
    YAHOO_FULL=<<-EOF.strip
<?xml version="1.0" encoding="UTF-8"?>
<ResultSet version="1.0"><Error>0</Error><ErrorMessage>No error</ErrorMessage><Locale>us_US</Locale><Quality>87</Quality><Found>1</Found><Result><quality>87</quality><latitude>37.792418</latitude><longitude>-122.393913</longitude><offsetlat>37.792332</offsetlat><offsetlon>-122.394027</offsetlon><radius>500</radius><name></name><line1>100 Spear St</line1><line2>San Francisco, CA  94105-1578</line2><line3></line3><line4>United States</line4><house>100</house><street>Spear St</street><xstreet></xstreet><unittype></unittype><unit></unit><postal>94105-1578</postal><neighborhood></neighborhood><city>San Francisco</city><county>San Francisco County</county><state>California</state><country>United States</country><countrycode>US</countrycode><statecode>CA</statecode><countycode></countycode><uzip>94105</uzip><hash>0FA06819B5F53E75</hash><woeid>12797156</woeid><woetype>11</woetype></Result></ResultSet>
<!-- gws14.maps.ch1.yahoo.com uncompressed/chunked Tue May 17 05:35:35 PDT 2011 -->
    EOF

    YAHOO_CITY=<<-EOF.strip
    <?xml version="1.0" encoding="UTF-8"?>
<ResultSet version="1.0"><Error>0</Error><ErrorMessage>No error</ErrorMessage><Locale>us_US</Locale><Quality>40</Quality><Found>1</Found><Result><quality>40</quality><latitude>37.777125</latitude><longitude>-122.419644</longitude><offsetlat>37.777125</offsetlat><offsetlon>-122.419644</offsetlon><radius>10700</radius><name></name><line1></line1><line2>San Francisco, CA</line2><line3></line3><line4>United States</line4><house></house><street></street><xstreet></xstreet><unittype></unittype><unit></unit><postal></postal><neighborhood></neighborhood><city>San Francisco</city><county>San Francisco County</county><state>California</state><country>United States</country><countrycode>US</countrycode><statecode>CA</statecode><countycode></countycode><uzip>94102</uzip><hash></hash><woeid>2487956</woeid><woetype>7</woetype></Result></ResultSet>
<!-- gws14.maps.ch1.yahoo.com uncompressed/chunked Tue May 17 05:33:47 PDT 2011 -->
    EOF

    YAHOO_MULTIPLE_RESULTS =<<-EOF.strip
<?xml version="1.0" encoding="UTF-8"?>
<ResultSet version="1.0"><Error>0</Error><ErrorMessage>No error</ErrorMessage><Locale>us_US</Locale><Quality>90</Quality><Found>7</Found><Result><quality>72</quality><latitude>51.523480</latitude><longitude>-0.158134</longitude><offsetlat>51.523480</offsetlat><offsetlon>-0.158134</offsetlon><radius>500</radius><name></name><line1>Baker Street</line1><line2>London</line2><line3>NW1 5</line3><line4>United Kingdom</line4><house></house><street>Baker Street</street><xstreet></xstreet><unittype></unittype><unit></unit><postal>NW1 5</postal><neighborhood>Marylebone</neighborhood><city>London</city><county>London</county><state>England</state><country>United Kingdom</country><countrycode>GB</countrycode><statecode>ENG</statecode><countycode>LND</countycode><uzip>NW1 5</uzip><hash></hash><woeid>26350015</woeid><woetype>11</woetype></Result><Result><quality>72</quality><latitude>51.523995</latitude><longitude>-0.158364</longitude><offsetlat>51.523995</offsetlat><offsetlon>-0.158364</offsetlon><radius>500</radius><name></name><line1>Baker Street</line1><line2>London</line2><line3>NW1 6</line3><line4>United Kingdom</line4><house></house><street>Baker Street</street><xstreet></xstreet><unittype></unittype><unit></unit><postal>NW1 6</postal><neighborhood>Marylebone</neighborhood><city>London</city><county>London</county><state>England</state><country>United Kingdom</country><countrycode>GB</countrycode><statecode>ENG</statecode><countycode>LND</countycode><uzip>NW1 6</uzip><hash></hash><woeid>26350016</woeid><woetype>11</woetype></Result><Result><quality>72</quality><latitude>51.516565</latitude><longitude>-0.155019</longitude><offsetlat>51.516565</offsetlat><offsetlon>-0.155019</offsetlon><radius>500</radius><name></name><line1>Baker Street</line1><line2>London</line2><line3>W1H 6</line3><line4>United Kingdom</line4><house></house><street>Baker Street</street><xstreet></xstreet><unittype></unittype><unit></unit><postal>W1H 6</postal><neighborhood>Marylebone</neighborhood><city>London</city><county>London</county><state>England</state><country>United Kingdom</country><countrycode>GB</countrycode><statecode>ENG</statecode><countycode>LND</countycode><uzip>W1H 6</uzip><hash></hash><woeid>26352752</woeid><woetype>11</woetype></Result><Result><quality>72</quality><latitude>51.521200</latitude><longitude>-0.157089</longitude><offsetlat>51.521200</offsetlat><offsetlon>-0.157089</offsetlon><radius>500</radius><name></name><line1>Baker Street</line1><line2>London</line2><line3>W1U 6</line3><line4>United Kingdom</line4><house></house><street>Baker Street</street><xstreet></xstreet><unittype></unittype><unit></unit><postal>W1U 6</postal><neighborhood>Marylebone</neighborhood><city>London</city><county>London</county><state>England</state><country>United Kingdom</country><countrycode>GB</countrycode><statecode>ENG</statecode><countycode>LND</countycode><uzip>W1U 6</uzip><hash></hash><woeid>26352783</woeid><woetype>11</woetype></Result><Result><quality>72</quality><latitude>51.517785</latitude><longitude>-0.155564</longitude><offsetlat>51.517785</offsetlat><offsetlon>-0.155564</offsetlon><radius>500</radius><name></name><line1>Baker Street</line1><line2>London</line2><line3>W1U 7</line3><line4>United Kingdom</line4><house></house><street>Baker Street</street><xstreet></xstreet><unittype></unittype><unit></unit><postal>W1U 7</postal><neighborhood>Marylebone</neighborhood><city>London</city><county>London</county><state>England</state><country>United Kingdom</country><countrycode>GB</countrycode><statecode>ENG</statecode><countycode>LND</countycode><uzip>W1U 7</uzip><hash></hash><woeid>26352784</woeid><woetype>11</woetype></Result><Result><quality>72</quality><latitude>51.519075</latitude><longitude>-0.156134</longitude><offsetlat>51.519075</offsetlat><offsetlon>-0.156134</offsetlon><radius>500</radius><name></name><line1>Baker Street</line1><line2>London</line2><line3>W1U 8</line3><line4>United Kingdom</line4><house></house><street>Baker Street</street><xstreet></xstreet><unittype></unittype><unit></unit><postal>W1U 8</postal><neighborhood>Marylebone</neighborhood><city>London</city><county>London</county><state>England</state><country>United Kingdom</country><countrycode>GB</countrycode><statecode>ENG</statecode><countycode>LND</countycode><uzip>W1U 8</uzip><hash></hash><woeid>26352785</woeid><woetype>11</woetype></Result><Result><quality>72</quality><latitude>51.524750</latitude><longitude>-0.158719</longitude><offsetlat>51.524750</offsetlat><offsetlon>-0.158719</offsetlon><radius>500</radius><name></name><line1>Baker Street</line1><line2>London</line2><line3>NW1 4</line3><line4>United Kingdom</line4><house></house><street>Baker Street</street><xstreet></xstreet><unittype></unittype><unit></unit><postal>NW1 4</postal><neighborhood>Regents Park</neighborhood><city>London</city><county>London</county><state>England</state><country>United Kingdom</country><countrycode>GB</countrycode><statecode>ENG</statecode><countycode>LND</countycode><uzip>NW1 4</uzip><hash></hash><woeid>26350014</woeid><woetype>11</woetype></Result></ResultSet>
<!-- gws13.maps.ch1.yahoo.com uncompressed/chunked Tue May 17 07:04:16 PDT 2011 -->
    EOF

  def setup
    super
    @yahoo_full_hash = {:street_address=>"100 Spear St", :city=>"San Francisco", :state=>"CA", :zip=>"94105-1522", :country_code=>"US"}
    @yahoo_city_hash = {:city=>"San Francisco", :state=>"CA"}
    @yahoo_full_loc = Geokit::GeoLoc.new(@yahoo_full_hash)
    @yahoo_city_loc = Geokit::GeoLoc.new(@yahoo_city_hash)
    @api_url = 'http://where.yahooapis.com/geocode'
  end
  
  # the testing methods themselves
  def test_yahoo_full_address
    response = MockSuccess.new
    response.expects(:body).returns(YAHOO_FULL)
    url = "#{@api_url}?appid=Yahoo&location=#{Geokit::Inflector.url_escape(@address)}"
    Geokit::Geocoders::YahooGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    do_full_address_assertions(Geokit::Geocoders::YahooGeocoder.geocode(@address))
  end 
  
  def test_yahoo_full_address_accuracy
    response = MockSuccess.new
    response.expects(:body).returns(YAHOO_FULL)
    url = "#{@api_url}?appid=Yahoo&location=#{Geokit::Inflector.url_escape(@address)}"
    Geokit::Geocoders::YahooGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    res = Geokit::Geocoders::YahooGeocoder.geocode(@address)
    assert_equal 87, res.accuracy.to_i
  end
  
  def test_yahoo_full_address_with_geo_loc
    response = MockSuccess.new
    response.expects(:body).returns(YAHOO_FULL)
    url = "#{@api_url}?appid=Yahoo&location=#{Geokit::Inflector.url_escape(@full_address)}"
    Geokit::Geocoders::YahooGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    do_full_address_assertions(Geokit::Geocoders::YahooGeocoder.geocode(@yahoo_full_loc))
  end  

  def test_yahoo_city
    response = MockSuccess.new
    response.expects(:body).returns(YAHOO_CITY)
    url = "#{@api_url}?appid=Yahoo&location=#{Geokit::Inflector.url_escape(@address)}"
    Geokit::Geocoders::YahooGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    do_city_assertions(Geokit::Geocoders::YahooGeocoder.geocode(@address))
  end
  
  def test_yahoo_city_accuracy
    response = MockSuccess.new
    response.expects(:body).returns(YAHOO_CITY)
    url = "#{@api_url}?appid=Yahoo&location=#{Geokit::Inflector.url_escape(@address)}"
    Geokit::Geocoders::YahooGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    res = Geokit::Geocoders::YahooGeocoder.geocode(@address)
    assert_equal 40, res.accuracy.to_i
  end
  
  def test_yahoo_city_with_geo_loc
    response = MockSuccess.new
    response.expects(:body).returns(YAHOO_CITY)
    url = "#{@api_url}?appid=Yahoo&location=#{Geokit::Inflector.url_escape(@address)}"  
    Geokit::Geocoders::YahooGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    do_city_assertions(Geokit::Geocoders::YahooGeocoder.geocode(@yahoo_city_loc))
  end  
  
  def test_service_unavailable
    response = MockFailure.new
    url = "#{@api_url}?appid=Yahoo&location=#{Geokit::Inflector.url_escape(@address)}"
    Geokit::Geocoders::YahooGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    assert !Geokit::Geocoders::YahooGeocoder.geocode(@yahoo_city_loc).success
  end  

  def test_multiple_results
    address = 'Baker Street, London'
    response = MockSuccess.new
    response.expects(:body).returns(YAHOO_MULTIPLE_RESULTS)
    url = "#{@api_url}?appid=Yahoo&location=#{Geokit::Inflector.url_escape(address)}"
    Geokit::Geocoders::YahooGeocoder.expects(:call_geocoder_service).with(url).returns(response)
    result = Geokit::Geocoders::YahooGeocoder.geocode(address)

    assert result.is_a?(Geokit::GeoLoc)
    assert result.success?
    assert_equal 7, result.all.size
  end

  private

  # next two methods do the assertions for both address-level and city-level lookups
  def do_full_address_assertions(res)
    assert_equal "CA", res.state
    assert_equal "San Francisco", res.city
    assert_equal "37.792418,-122.393913", res.ll
    assert res.is_us?
    assert_equal "100 Spear St, San Francisco, CA 94105-1578", res.full_address
    assert_equal "yahoo", res.provider
  end
  
  def do_city_assertions(res)
    assert_equal "CA", res.state
    assert_equal "San Francisco", res.city 
    assert_equal "37.777125,-122.419644", res.ll
    assert res.is_us?
    assert_equal "San Francisco, CA, US", res.full_address 
    assert_nil res.street_address
    assert_equal "yahoo", res.provider
  end  
end
