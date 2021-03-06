# encoding: utf-8

module Rubocop
  module Cop
    module Lint
      # This cop checks for uses of *begin...end while/until something*.
      class Loop < Cop
        MSG = 'Use Kernel#loop with break rather than ' +
              'begin/end/until(or while).'

        def on_while(node)
          check(node)

          super
        end

        def on_until(node)
          check(node)

          super
        end

        private

        def check(node)
          _cond, body = *node
          type = node.type.to_s

          if body.type == :begin &&
              !node.loc.expression.source.start_with?(type)
            add_offence(:warning, node.loc.keyword, MSG)
          end
        end
      end
    end
  end
end
