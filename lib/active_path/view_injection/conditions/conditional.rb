module ActivePath
  module ViewInjection
    module Conditions
      module Conditional
        def conditions_match?(conditions)
          conditions.all? do |condition|
            condition_match?(condition)
          end
        end

        def condition_match?(condition)
          if condition.is_a?(Hash)
            hash_match?(condition)
          elsif condition.is_a?(Proc)
            proc_match?(condition)
          end
        end

        def hash_match?(condition)
          condition.all? do |k,v|
            options[:locals][k] == v
          end
        end

        def proc_match?(condition)
          condition.call(options[:locals])
        end
      end
    end
  end
end