require 'helper'

scope 'Hobbit integration' do
  setup do
    @app = HobbitApp.new
  end

  scope '::environment' do
    test 'returns the current environment' do
      with_env('development') do
        assert_equal :development, HobbitApp.environment
      end
    end

    test 'returns :development if there is no current environment' do
      with_env(nil) do
        assert_equal :development, HobbitApp.environment
      end
    end
  end

  scope '#environment' do
    test 'returns the current environment' do
      with_env('development') do
        assert_equal :development, @app.to_app.class.environment
      end
    end

    test 'returns :development if there is no current environment' do
      with_env(nil) do
        assert_equal :development, @app.to_app.class.environment
      end
    end
  end

  scope '::development?' do
    test "returns true if ENV['RACK_ENV'] = :development" do
      with_env('development') do
        assert HobbitApp.development?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :development" do
      assert !HobbitApp.development?
    end
  end

  scope '#development?' do
    test "returns true if ENV['RACK_ENV'] = :development" do
      with_env('development') do
        assert @app.to_app.class.development?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :development" do
      assert !@app.to_app.class.development?
    end
  end

  scope '::production?' do
    test "returns true if ENV['RACK_ENV'] = :production" do
      with_env('production') do
        assert HobbitApp.production?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :production" do
      assert !HobbitApp.production?
    end
  end

  scope '#production?' do
    test "returns true if ENV['RACK_ENV'] = :production" do
      with_env('production') do
        assert @app.to_app.class.production?
      end
    end

    test "returns false if ENV['RACK_ENV'] != :production" do
      assert !@app.to_app.class.production?
    end
  end

  scope '::test?' do
    test "returns true if ENV['RACK_ENV'] = :test" do
      assert HobbitApp.test?
    end

    test "returns false if ENV['RACK_ENV'] != :test" do
      with_env('development') do
        assert !HobbitApp.test?
      end
    end
  end

  scope '#test?' do
    test "returns true if ENV['RACK_ENV'] = :test" do
      assert @app.to_app.class.test?
    end

    test "returns false if ENV['RACK_ENV'] != :test" do
      with_env('development') do
        assert !@app.to_app.class.test?
      end
    end
  end
end
