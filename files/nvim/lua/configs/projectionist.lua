local heuristics = function(projects)
  local result = {}
  for _, project_name in pairs(projects) do
    result['packs/'..project_name..'/app/public/*.rb'] = {
      type = 'source',
      alternate = {'packs/'..project_name..'/spec/{}_spec.rb'},
      template = {
        '# typed: strict',
        '# frozen_string_literal: true'
      }
    }
    result['packs/'..project_name..'/app/lib/*.rb'] = {
      type = 'source',
      alternate = {'packs/'..project_name..'/spec/{}_spec.rb'},
      template = {
        '# typed: strict',
        '# frozen_string_literal: true',
        '',
        'module {camelcase|colons}',
        'end'
      }
    }
    result['packs/'..project_name..'/spec/*_spec.rb'] = {
      type = 'test',
      alternate = {'packs/'..project_name..'/app/public/{}.rb', 'packs/'..project_name..'/app/lib/{}.rb'},
      template = {
        '# frozen_string_literal: true',
        '',
        "require 'rails_helper'",
        '',
        'RSpec.describe {camelcase|colons} do',
        "  describe '.call' do",
        '    subject do',
        '      described_class.call',
        '    end',
        '',
        '    it do',
        '      expect(subject).to be_truthy',
        '    end',
        '  end',
        'end'
      }
    }
  end
  return result
end

vim.g.projectionist_heuristics = {
  ['packs/cashout/*|packs/underwriting/*|packs/socure/*'] = heuristics({'cashout', 'socure', 'underwriting'})
}
