 RSpec::Qbec

### Init

```rb
# spec_helper.rb

# Example:
require 'rspec/qbec'

RSpec.configure do |config|
  config.qbec_root = 'qbec/project'
end
```


### Example test

```rb
  let!(:cmd) { run_qbec('prod', '-c namespace') }
  let!(:namespaces) { yaml(cmd[0], 'Namespaces') }

  it 'have size' do
    expect(namespaces.size).to eq(1)
  end

  it 'have name' do
    expect(namespaces.metadata.name).to eq('myns')
  end
```
