# RSpec

> If debugging is the process of removing bugs, then programming must be the
> process of putting them in. - Edsger Dijkstra

---

## Anatomy of an RSpec test

```ruby
# Testing a class or module
describe SomeModule::SomeClass do
    
    # Testing a method of that class or module
    describe ".multiply" do

        # Designate inputs for the test cases
        let(:input_one) { 1 }
        let(:input_two) { 2 }
        
        # One set of inputs
        context "multiply by 0" do
            let(:input_two) { 0 }
            it "returns 0" do
                expect(SomeModule::SomeClass.multiple(input_one, input_two)).to eq(0)
            end
        end
    end
end
```

## Using Let for testing outputs

```ruby
describe SomeModule::SomeClass do
    let(:input_one) { 10 }
    let(:input_two) { 20 }

    let(:result) do
        described_class.some_method_call(
            input_one: input_one,
            input_two: input_two
        )
    end

    # :result will be lazy loaded during the test based on inputs set in each
    # test context and run in each context separately
end
```

## Expectations

```ruby
# Numerical
expect(subject.value).to eq(num)
expect(subject.value).to_not eq(num)
expect(subject.value).to be > 4
expect(subject.value).to be <= 5
expect(subject.value).to be_between(1, 5).inclusive
expect(subject.value).to be_between(1, 5).exclusive
expect(subject.value).to be_within(0.01).of(expected_value)

# Boolean
expect(subject.value).to be true
expect(subject.value).to be false
expect(subject.value).to be_truthy
expect(subject.value).to be_falsy
expect(subject.value).to be_nil

# Arrays
expect([1, 2, 3]).to include(1)
expect({ a: 1, b: 2 }).to include(b: 2)
expect([1, 3, 5, 7]).to all be_odd
expect([1, 3, 5, 7]).to all be_even

# Exceptions
expect { code_block }.to raise_error(Error::MyException)

# Expecting method calls
# Syntax is similar to stubs
expect(TopModule::LowerModule).to receive(:function_name)
    .with(params)
    .and_return(results)
```

## Hooks

```ruby
# Sets a method stub for TopModule::LowerModule.function_name
before do
    # Mock method calls
    allow(TopModule::LowerModule).to receive(:function_name)
        .with(param_one: 3, param_two: 4)
        .and_return(double(a: 3, b: 5))
end
```

## Mocks

```ruby
# Creates a generic test double as a stub
# http_response.status returns 200
http_response = double(status: 200, body: 'OK')
```
