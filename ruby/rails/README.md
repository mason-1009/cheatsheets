# Ruby on Rails

> Rails has done more for startups than a whole boatload of venture capitalists. - Eric Ries

---

### Models

Generate a model and a corresponding migration
```
bin/rails generate model Thing name:string is_active:boolean number:integer
```

Create an ActiveRecord model with a custom ID column

```
# Model
class User < ApplicationRecord
  self.primary_key = :custom_id
end

# Migration
class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, id: false, primary_key: :custom_id do |t|
      t.string :custom_id, null: false

      # Other things

      t.index :custom_id, unique: true
    end
  end
end
```

Create a foreign-key relationship

```
# Models
class Master < ApplicationRecord
  has_many :slaves
  # Use has_one :slave for one-to-one
end

class Slave < ApplicationRecord
  belongs_to :master, optional: true
end

# Migrations
class CreateMasters < ActiveRecord::Migration[7.1]
  def change
    create_table :masters do |t|
        # Fields
    end
  end
end

class CreateSlaves < ActiveRecord::Migration[7.1]
  def change
    create_table :slaves do |t|
      # Creates a reference with a foreign-key constraint
      t.references :master, foreign_key: true
    end
  end
end
```
