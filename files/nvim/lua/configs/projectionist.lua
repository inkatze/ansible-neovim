g = vim.g

g.projectionist_heuristics = {
  ['packs/cashout/*'] = {
    ['packs/cashout/app/public/*.rb'] = {
      type = 'source',
      alternate = {'packs/cashout/spec/{}_spec.rb', 'packs/cashout/spec/{}_integration_spec.rb'},
      template = {
        '# typed: strict',
        '# frozen_string_literal: true'
      }
    },
    ['packs/cashout/app/lib/*.rb'] = {
      type = 'source',
      alternate = {'packs/cashout/spec/{}_spec.rb', 'packs/cashout/spec/{}_integration_spec.rb'},
      template = {
        '# typed: strict',
        '# frozen_string_literal: true'
      }
    },
    ['packs/cashout/app/jobs/*.rb'] = {
      type = 'source',
      alternate = {'packs/cashout/spec/{}_spec.rb', 'packs/cashout/spec/{}_integration_spec.rb'},
      template = {
        '# typed: strict',
        '# frozen_string_literal: true'
      }
    },
    ['packs/cashout/spec/*_spec.rb'] = {
      type = 'test',
      alternate = {'packs/cashout/app/public/{}.rb', 'packs/cashout/app/lib/{}.rb', 'packs/cashout/app/jobs/{}.rb'},
      template = {
        '# typed: true',
        '# frozen_string_literal: true'
      }
    },
    ['packs/cashout/spec/*_integration_spec.rb'] = {
      type = 'test',
      alternate = {'packs/cashout/app/public/{}.rb', 'packs/cashout/app/lib/{}.rb', 'packs/cashout/app/jobs/{}.rb'},
      template = {
        '# typed: true',
        "# frozen_string_literal: true",
      }
    }
  }
}
