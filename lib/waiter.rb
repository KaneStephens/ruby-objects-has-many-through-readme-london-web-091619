require "pry"

class Waiter

    attr_reader :name, :years_of_experience

    @@all = []

    def initialize(name, experience)
        @name = name
        @ayears_of_experience = experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        big_tip = 0
        big_tipper = ""
        meals.select {|meal| 
            if meal.tip > big_tip 
                big_tip = meal.tip
                big_tipper = meal.customer
            end
        }
        return big_tipper
    end







end