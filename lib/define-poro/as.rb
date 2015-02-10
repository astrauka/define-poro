module DefinePoro
  class As
    def self.new(*attributes, &block)
      Class.new do
        class_eval(%(
          attr_reader #{attributes.map { |a| ":#{a}" }.join(', ')}

          def initialize(#{attributes.join(', ')})
            #{attributes.map { |a| "@#{a}=#{a}" }.join('; ')}
          end
        ))

        class_exec &block if block_given?
      end
    end
  end
end
