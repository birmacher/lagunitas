require 'test_helper'

module Lagunitas
  class AppTest < TestCase
    def setup
      @ipa = Lagunitas::IPA.new('test/data/Sample.ipa')
      @app = @ipa.app
    end

    def test_ipa_size
      assert_equal 77808, @ipa.size
    end

    def test_identifier
      assert_equal 'com.samsoffes.Sample', @app.identifier
    end

    def test_display_name
      assert_equal 'Sample', @app.display_name
    end

    def test_version
      assert_equal '13', @app.version
    end

    def test_short_version
      assert_equal '2.2', @app.short_version
    end

    def test_creation_date
      assert_equal Time.parse('2013-10-30T17:23:25Z'), @app.creation_date
    end

    def test_expiration_date
      assert_equal Time.parse('2014-10-30T17:23:25Z'), @app.expiration_date
    end

    def test_provision_devices
      assert_equal devices, @app.provision_devices
    end

    def test_icons
      assert_includes @app.icon(120), 'AppIcon60x60@2x.png'
      assert_includes @app.uncrushed_icon(120), 'AppIcon60x60@2x_u.png'
      assert_nil @app.icon(1024)
    end

    def teardown
      @ipa.cleanup if @ipa
    end

    def devices
      ["d25facd478d644a646603f91c1bc3edec71c55db", "9d18902aa6ebb7c290bc70b20f343d994a3f2085", "dafbc8b58ca344f9c2d5a16edd02473dd7fb6949", "319c09916944f169b0457619f150b1739e230c88", "4f57541ee9144b7806c3c8618539a4eee478b16c", "766b10975e563005fa4ad39e070e0a03f1a54d6c", "9eb4efe2995875b48c1f2afaa61dda38197c2ede", "cb482c5c13ebfcba826079bc9e43d36b044e69db", "566497d948f2eff22095c164fca8b8694943f4e9", "ba791d611dba1dbb0007f413f3856aff6692a0b4", "cd7e15b2a5e82375678756aa1cd6ce54d60b363d", "a041a334d10861026163162b3734ecb24913c51e", "edee772f04f731498cfdfaac4204c96035ac3e3c", "38d78ea35859517e58d6962c347461433d346eda", "52607a4edd7b4ba8d83b9501af77a26eb079f9e2", "613147ac74d374a1448c2f213ffa6e3c191be9ce", "4264e76a96143bafab95a5d9778c4041c6b4433a", "b7a851818c9d668837b0203d62d072aad4576ba8", "de82871e6e635199c6eaa10f253a6bd010de7577", "d5a1642b6d7c751e845065750d73032a3ce82133", "2afbbfddb2a80d4190c2e333ade66cfc8bea4e1e", "6c064aec2df9d8ace54cd0455f62a61a405fa059", "3e171d1235caba5872f3dbe7cc8e02d78c368224", "3df0c8538c6f09f86723e8b5e9441ed381ab7032", "e8ccb0f997be5383d0c83240dde269471db3a294", "9cb258ca6d6bd3c6e2e4db555caeb3ada53449e5", "73df86a124414c6dda83879c17d2b41f54fd063d", "54d8740cb0319c10f30e469a4d56f5e6c5ebb3d6", "1507cca65c6df77784a6a418bf2d30937021b83d", "cb9cc8506a501b50734626a7676b5e5be102ec39", "6768b6697c202c74d1cd48ca3f5168b7fe1d3b70", "60b899ded46b25dc0f6db0d7ab9a349d0499eb0b", "276c8cd37b1dfc7146905fc7cf7227488f5f319c"]
    end
  end
end
