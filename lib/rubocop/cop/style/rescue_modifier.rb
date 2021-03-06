# encoding: utf-8

module Rubocop
  module Cop
    module Style
      # This cop checks for uses of rescue in its modifier form.
      class RescueModifier < Cop
        MSG = 'Avoid using rescue in its modifier form.'

        def on_rescue(node)
          add_offence(:convention, node.loc.expression, MSG)
        end

        alias_method :on_begin, :ignore_node
      end
    end
  end
end
