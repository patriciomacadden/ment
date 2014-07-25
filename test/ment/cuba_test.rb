require 'helper'

scope 'Cuba integration' do
  setup do
    @app = Cuba.new
  end

  scope '::environment' do
    test 'returns the current environment' do
      with_env('development') do
        assert_equal :development, Cuba.environment
      end
    end
  end

  scope '#environment' do
    test 'returns the current environment' do
      with_env('development') do
        assert_equal :development, @app.environment
      end
    end
  end

  scope '::development?' do
    test "returns true if ENV['RACK_ENV'] = :development" do
      with_env('development') do
        assert Cuba.development?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :development" do
      assert !Cuba.development?
    end
  end

  scope '#development?' do
    test "returns true if ENV['RACK_ENV'] = :development" do
      with_env('development') do
        assert @app.development?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :development" do
      assert !@app.development?
    end
  end

  scope '::production?' do
    test "returns true if ENV['RACK_ENV'] = :production" do
      with_env('production') do
        assert Cuba.production?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :production" do
      assert !Cuba.production?
    end
  end

  scope '#production?' do
    test "returns true if ENV['RACK_ENV'] = :production" do
      with_env('production') do
        assert @app.production?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :production" do
      assert !@app.production?
    end
  end

  scope '::test?' do
    test "returns true if ENV['RACK_ENV'] = :test" do
      assert Cuba.test?
    end

    test "returns false if ENV['RACK_ENV'] != :test" do
      with_env('development') do
        assert !Cuba.test?
      end
    end
  end

  scope '#test?' do
    test "returns true if ENV['RACK_ENV'] = :test" do
      assert @app.test?
    end

    test "returns false if ENV['RACK_ENV'] != :test" do
      with_env('development') do
        assert !@app.test?
      end
    end
  end
end
