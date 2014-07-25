require 'helper'

scope Ment do
  setup do
    @app = App.new
  end

  scope '::environment' do
    test 'returns the current environment' do
      with_env('development') do
        assert_equal :development, App.environment
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
        assert App.development?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :development" do
      assert !App.development?
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
        assert App.production?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :production" do
      assert !App.production?
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
      assert App.test?
    end

    test "returns false if ENV['RACK_ENV'] != :test" do
      with_env('development') do
        assert !App.test?
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
