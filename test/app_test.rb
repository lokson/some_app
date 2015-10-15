require_relative 'test_helper'

class TestApp < Minitest::Test
  def setup
    @app = App.new
  end

  def test_overall
    assert_equal '0,1,NORTH', @app.exec('PLACE 0,0,NORTH MOVE REPORT')
    assert_equal '0,0,WEST', @app.exec('PLACE 0,0,NORTH LEFT REPORT')
    assert_equal '3,3,NORTH', @app.exec('PLACE 1,2,EAST MOVE MOVE LEFT MOVE REPORT')
  end

  def test_rotate_left
    assert_equal "2,2,WEST", @app.exec('PLACE 2,2,NORTH LEFT REPORT'), 'rotate left'
    assert_equal "2,2,SOUTH", @app.exec('PLACE 2,2,WEST LEFT REPORT'), 'rotate left'
    assert_equal "2,2,EAST", @app.exec('PLACE 2,2,SOUTH LEFT REPORT'), 'rotate left'
    assert_equal "2,2,NORTH", @app.exec('PLACE 2,2,EAST LEFT REPORT'), 'rotate left'
  end

  def test_rotate_right
    assert_equal "2,2,EAST", @app.exec('PLACE 2,2,NORTH RIGHT REPORT'), 'rotate right'
    assert_equal "2,2,NORTH", @app.exec('PLACE 2,2,WEST RIGHT REPORT'), 'rotate right'
    assert_equal "2,2,WEST", @app.exec('PLACE 2,2,SOUTH RIGHT REPORT'), 'rotate right'
    assert_equal "2,2,SOUTH", @app.exec('PLACE 2,2,EAST RIGHT REPORT'), 'rotate right'
  end

  def test_movement
    assert_equal "2,3,NORTH", @app.exec('PLACE 2,2,NORTH MOVE REPORT'), 'move north'
    assert_equal "1,2,WEST", @app.exec('PLACE 2,2,WEST MOVE REPORT'), 'move west'
    assert_equal "2,1,SOUTH", @app.exec('PLACE 2,2,SOUTH MOVE REPORT'), 'move south'
    assert_equal "3,2,EAST", @app.exec('PLACE 2,2,EAST MOVE REPORT'), 'move east'
  end

  def test_placed_more_than_once
    assert_equal '0,0,NORTH', @app.exec('PLACE 2,2,NORTH MOVE PLACE 0,0,NORTH REPORT'), 'placed twice'
  end

  def test_command_before_placement
    assert_equal '2,2,NORTH', @app.exec('LEFT MOVE REPORT PLACE 2,2,NORTH REPORT'), 'commands before placement'
  end

  def test_wrong_input
    assert_equal '', @app.exec('PLACE 0,0,NORTH WRONG'), 'wrong command'
    assert_equal '', @app.exec('PLACE WRONG'), 'wrong command param'
  end

  def test_wrong_placement
    assert_equal '', @app.exec('PLACE 5,5,NORTH REPORT'), 'wrong place coords'
  end

  def test_drop_attempt
    assert_equal '2,4,NORTH', @app.exec('PLACE 2,4,NORTH MOVE REPORT'), 'move outside tabletop'
    assert_equal '3,4,EAST', @app.exec('PLACE 2,4,NORTH MOVE RIGHT MOVE REPORT'), 'move after drop attempt'
  end

  def test_report_twice
    assert_equal "2,2,NORTH\n2,3,NORTH", @app.exec('PLACE 2,2,NORTH REPORT MOVE REPORT'), 'report twice'
  end
end
