# Blog Application - Rails 8 Comprehensive Training Project

A **production-ready blog application** built with Rails 8.1.2 to master modern Rails development patterns, including authentication, authorization, advanced gem usage, testing, and professional UI/UX design.

## 📋 Table of Contents

- [Overview](#overview)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Features](#features)
- [Setup Instructions](#setup-instructions)
- [Running the Application](#running-the-application)
- [Database Setup](#database-setup)
- [Testing](#testing)
- [API Endpoints](#api-endpoints)
- [Key Learnings](#key-learnings)
- [Challenges & Solutions](#challenges--solutions)
- [Performance Optimizations](#performance-optimizations)
- [Deployment](#deployment)

---

## Overview

This project is a **comprehensive Rails training application** that covers:
- Core Rails concepts (MVC, routing, migrations)
- Advanced patterns (services, jobs, serializers)
- Authorization & authentication (Devise, Pundit, CanCanCan)
- Professional testing (RSpec, FactoryBot)
- Performance optimization (N+1 query prevention)
- Beautiful, responsive UI (Bootstrap 5 + custom CSS)

### What This Project Teaches
✅ Rails scaffolding and generators  
✅ RESTful API design patterns  
✅ Database migrations and ActiveRecord  
✅ Model validations and associations  
✅ Authorization & authentication workflows  
✅ Background job processing  
✅ Service-oriented architecture  
✅ Testing best practices  
✅ Performance debugging  
✅ Professional UI/UX design  

---

## Tech Stack

### Core Framework
- **Rails**: 8.1.2 (latest stable)
- **Ruby**: 3.3.0+
- **Database**: SQLite3 (development), PostgreSQL (recommended for production)

### Authentication & Authorization
- **Devise**: 4.9+ - User authentication with password recovery
- **Pundit**: 2.5+ - Authorization policies for fine-grained access control
- **CanCanCan**: 3.7+ - Role-based authorization with ability definitions

### API & Serialization
- **active_model_serializers**: 0.10+ - JSON serialization for models with associations

### Background Processing
- **Solid Queue**: 1.0+ (Rails 8 default) - Job queue backend
- **Solid Cache**: 1.0+ (Rails 8 default) - Cache backend
- **Solid Cable**: 1.0+ (Rails 8 default) - WebSocket backend

### Performance & Monitoring
- **Bullet**: 8.0+ - N+1 query detection in development
- **Prosopite**: 1.4+ - N+1 query detection in test environment

### Frontend
- **Bootstrap 5**: Via CDN - Responsive component framework
- **Turbo**: 8.0+ (Rails 8 default) - Fast page navigation
- **Stimulus**: 3.0+ (Rails 8 default) - JavaScript framework

### Testing
- **RSpec Rails**: 6.4+ - BDD testing framework
- **FactoryBot Rails**: 6.4+ - Test data factories
- **Faker**: 3.2+ - Realistic test data generation
- **Pundit Matchers**: 3.1+ - Policy testing helpers

### Security & Code Quality
- **Brakeman**: 6.1+ - Rails security scanner
- **Rubocop**: 1.59+ - Ruby code style linter
- **Bundler Audit**: Latest - Dependency vulnerability scanner

### Development Tools
- **Puma**: 6.4+ - Application server
- **Importmap Rails**: Asset bundling (Rails 8 default)
- **Sprockets**: 4.2+ - Asset pipeline

---

## Project Structure

```
new_blog_app/
├── app/
│   ├── controllers/
│   │   ├── application_controller.rb       # Base controller with Pundit auth
│   │   ├── blogs_controller.rb             # Blog CRUD & publish API
│   │   ├── comments_controller.rb          # Comment CRUD
│   │   └── concerns/
│   ├── models/
│   │   ├── user.rb                         # Devise user with roles
│   │   ├── blog.rb                         # Blog model with scopes & validations
│   │   ├── comment.rb                      # Comment model
│   │   ├── ability.rb                      # CanCanCan authorization rules
│   │   └── concerns/
│   ├── views/
│   │   ├── layouts/
│   │   │   └── application.html.erb        # Main layout with navbar
│   │   ├── blogs/
│   │   │   ├── index.html.erb              # Blog listing (published only)
│   │   │   ├── show.html.erb               # Blog detail page
│   │   │   ├── new.html.erb                # Create blog form
│   │   │   ├── edit.html.erb               # Edit blog form
│   │   │   └── _blog.html.erb              # Blog card component
│   │   ├── comments/
│   │   │   ├── _form.html.erb              # Comment form
│   │   │   └── _comment.html.erb           # Comment display component
│   │   └── users/
│   │       └── sessions/new.html.erb       # Beautiful login page
│   ├── jobs/
│   │   ├── application_job.rb              # Base job class
│   │   └── publish_blog_job.rb             # Scheduled publish job (1 hour)
│   ├── services/
│   │   └── publish_blog_service.rb         # Blog publishing business logic
│   ├── serializers/
│   │   ├── blog_serializer.rb              # Blog JSON serialization
│   │   ├── comment_serializer.rb           # Comment JSON serialization
│   │   └── user_serializer.rb              # User JSON serialization
│   ├── helpers/
│   │   ├── application_helper.rb
│   │   ├── blogs_helper.rb
│   │   └── comments_helper.rb
│   ├── policies/
│   │   ├── application_policy.rb           # Base Pundit policy
│   │   ├── blog_policy.rb                  # Blog authorization rules
│   │   └── comment_policy.rb               # Comment authorization rules
│   └── assets/
│       ├── images/
│       └── stylesheets/
│           └── application.css             # Custom styles (800+ lines)
├── config/
│   ├── routes.rb                           # RESTful routes
│   ├── database.yml                        # Database configuration
│   ├── credentials.yml.enc                 # Encrypted credentials
│   ├── puma.rb                             # Puma server config
│   ├── queue.yml                           # Solid Queue config
│   ├── initializers/
│   │   ├── devise.rb                       # Devise configuration
│   │   ├── bullet.rb                       # Bullet N+1 detection
│   │   ├── prosopite.rb                    # Prosopite N+1 detection
│   │   ├── filter_parameter_logging.rb     # Log sensitive params
│   │   └── content_security_policy.rb      # Security headers
│   └── environments/
│       ├── development.rb
│       ├── test.rb
│       └── production.rb
├── db/
│   ├── migrate/                            # All database migrations
│   ├── schema.rb                           # Schema snapshot
│   └── seeds.rb                            # Test data generation
├── spec/
│   ├── rails_helper.rb                     # RSpec configuration
│   ├── spec_helper.rb
│   ├── factories/                          # FactoryBot factories
│   │   ├── users.rb
│   │   ├── blogs.rb
│   │   └── comments.rb
│   ├── models/                             # Model tests
│   │   ├── blog_spec.rb
│   │   ├── comment_spec.rb
│   │   └── user_spec.rb
│   ├── requests/                           # Request/API tests
│   │   └── blogs_spec.rb
│   └── policies/                           # Authorization tests
│       ├── blog_policy_spec.rb
│       └── comment_policy_spec.rb
├── lib/
│   └── tasks/
│       └── blogs.rake                      # Custom rake tasks
├── Gemfile                                 # Ruby dependencies
├── Gemfile.lock                            # Locked dependency versions
├── .gitignore                              # Git ignore rules
├── Dockerfile                              # Docker configuration
├── docker-compose.yml                      # Multi-container setup
├── Rakefile
├── config.ru                               # Rack config
├── TRAINING_CHECKLIST_COMPLETION.md        # Detailed completion report
└── README.md                               # This file
```

---

## Features

### ✅ Blog Management
- Create, read, update, delete blogs
- Publish/draft state management
- Beautiful listing with pagination support
- Published and draft blog separation
- Search & filter functionality ready

### ✅ Comments System
- Add comments to published blogs only
- Edit/delete own comments
- Nested comment display
- Comment count tracking

### ✅ User Management
- User registration and login (Devise)
- Password recovery via email
- User profile pages
- Admin role designation
- User listing for admins

### ✅ Authorization & Authentication
- Role-based access control (user/admin)
- Blogs: creator or admin can edit/delete
- Blogs: only creator/admin can see drafts
- Comments: creator or admin can modify
- Admin: full access to all resources
- Pundit policies for view-level checks

### ✅ Background Jobs
- Automatic blog publish scheduled 1 hour after creation
- Solid Queue for reliable job processing
- Job monitoring and retry logic

### ✅ Performance Optimization
- N+1 query prevention with eager loading
- Bullet gem for development detection
- Prosopite gem for test detection
- Serializers for optimized API responses
- Database indexing on foreign keys

### ✅ Testing
- Comprehensive RSpec test suite
- Unit tests for models
- Request tests for API endpoints
- Authorization policy tests
- Test factories with realistic data
- 100%+ test coverage for critical paths

### ✅ UI/UX
- Professional Bootstrap 5 design
- Responsive mobile-first layout
- Beautiful authentication pages
- Smooth Turbo navigation
- Modern gradient backgrounds
- Card-based component design
- Accessibility features

---

## Setup Instructions

### Prerequisites

```bash
# Check Ruby version (3.3.0+)
ruby --version

# Check SQLite3 installation
sqlite3 --version

# Check if Bundler is installed
bundle --version
# If not: gem install bundler
```

### 1. Clone Repository
```bash
git clone <repository-url>
cd new_blog_app
```

### 2. Install Dependencies
```bash
# Install Ruby gems
bundle install

# If you encounter gem compilation errors:
bundle install --with-system-libraries
```

### 3. Database Setup
```bash
# Create databases
rails db:create

# Run migrations
rails db:migrate

# Populate with seed data
rails db:seed
```

### 4. Credentials Setup
```bash
# Edit encrypted credentials (generates file if missing)
rails credentials:edit

# For development, you can use default Rails credentials
# In production, ensure RAILS_MASTER_KEY is set
```

### 5. Asset Precompilation (Optional for development)
```bash
# Import JavaScript dependencies
./bin/importmap audit

# Not needed for development but useful for testing production build
rails assets:precompile
```

---

## Running the Application

### Development Server
```bash
# Start with both Puma and job queue
./bin/dev

# Or start Puma separately
rails server
# Runs on http://localhost:3000

# And start job queue in another terminal
bundle exec solid_queue:start
```

### Access Points
- **Web App**: http://localhost:3000
- **Admin Dashboard**: Create admin user, then all blogs visible
- **Devise Login**: Default signup enabled

### Test Accounts (from seeds.rb)

```ruby
# Admin Account
Email: admin@example.com
Password: password123

# Regular User
Email: user@example.com
Password: password123
```

---

## Database Setup

### Create Database
```bash
rails db:create
```

### Run Migrations
```bash
rails db:migrate

# Check migration status
rails db:migrate:status

# Rollback last migration
rails db:rollback
```

### Seed Sample Data
```bash
rails db:seed

# Generates:
# - 1 admin user
# - 10+ regular users
# - 50+ blogs (mix of published/unpublished)
# - 100+ comments on published blogs
```

### Reset Database
```bash
# WARNING: Destroys all data
rails db:drop
rails db:create
rails db:migrate
rails db:seed
```

### Database Schema
```sql
-- Users table (Devise)
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  email VARCHAR UNIQUE NOT NULL,
  encrypted_password VARCHAR NOT NULL,
  reset_password_token VARCHAR UNIQUE,
  reset_password_sent_at DATETIME,
  role INTEGER DEFAULT 0, -- 0: user, 1: admin
  created_at DATETIME,
  updated_at DATETIME
);

-- Blogs table
CREATE TABLE blogs (
  id INTEGER PRIMARY KEY,
  title VARCHAR NOT NULL,
  body TEXT NOT NULL,
  published BOOLEAN DEFAULT false,
  user_id INTEGER NOT NULL REFERENCES users(id),
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY(user_id) REFERENCES users(id)
);

-- Comments table
CREATE TABLE comments (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  blog_id INTEGER NOT NULL REFERENCES blogs(id),
  user_id INTEGER NOT NULL REFERENCES users(id),
  created_at DATETIME,
  updated_at DATETIME,
  FOREIGN KEY(blog_id) REFERENCES blogs(id),
  FOREIGN KEY(user_id) REFERENCES users(id)
);
```

---

## Testing

### Run Full Test Suite
```bash
# Run all tests
bundle exec rspec

# Run with coverage report
bundle exec rspec --format documentation

# Run specific test file
bundle exec rspec spec/models/blog_spec.rb

# Run specific test
bundle exec rspec spec/models/blog_spec.rb:10
```

### Test Coverage
```bash
# Generate coverage report
COVERAGE=true bundle exec rspec

# View coverage in browser
open coverage/index.html
```

### Unit Tests
```bash
# Blog model tests
bundle exec rspec spec/models/blog_spec.rb

# Comment model tests
bundle exec rspec spec/models/comment_spec.rb

# User model tests
bundle exec rspec spec/models/user_spec.rb
```

### Request/API Tests
```bash
# Blog API endpoint tests
bundle exec rspec spec/requests/blogs_spec.rb
```

### Authorization Tests
```bash
# Blog policy tests
bundle exec rspec spec/policies/blog_policy_spec.rb

# Comment policy tests
bundle exec rspec spec/policies/comment_policy_spec.rb
```

### Test Data Factories
```ruby
# In any spec file:

# Create a user
user = create(:user)

# Create a blog
blog = create(:blog, user: user, published: true)

# Create multiple blogs
blogs = create_list(:blog, 5, published: true)

# Create with custom attributes
blog = create(:blog, title: "Custom Title", user: admin_user)
```

---

## API Endpoints

### Blog Endpoints

```
GET    /blogs                    # List published blogs
GET    /blogs/:id                # Show blog detail
GET    /blogs/drafts             # List user's draft blogs (auth required)
POST   /blogs                    # Create blog (auth required)
PATCH  /blogs/:id                # Update blog (owner/admin only)
DELETE /blogs/:id                # Delete blog (owner/admin only)
POST   /blogs/:id/publish        # Publish blog (owner/admin only)
```

### Comment Endpoints

```
POST   /blogs/:blog_id/comments           # Create comment (auth required)
DELETE /blogs/:blog_id/comments/:id       # Delete comment (owner/admin only)
```

### User Endpoints (Devise)

```
POST   /users/sign_up                     # Register new user
POST   /users/sign_in                     # Login
DELETE /users/sign_out                    # Logout
POST   /users/password                    # Forgot password
PATCH  /users/password                    # Reset password
GET    /users/edit                        # Edit profile
PATCH  /users                             # Update profile
```

### Example Requests

```bash
# Get published blogs
curl http://localhost:3000/blogs

# Get specific blog
curl http://localhost:3000/blogs/1

# Create blog (requires authentication)
curl -X POST http://localhost:3000/blogs \
  -H "Authorization: Bearer TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"blog": {"title": "My Blog", "body": "Content"}}'

# Publish blog
curl -X POST http://localhost:3000/blogs/1/publish \
  -H "Authorization: Bearer TOKEN"
```

---

## Key Learnings

### 1. Rails Scaffolding & Generators
**What We Did:**
- Used `rails scaffold` to generate Blog model, controller, views, and migrations
- Explored generated files to understand Rails conventions
- Used `rails generate` for selective component generation

**Command:**
```bash
rails scaffold Blog title:string body:text published:boolean user:references
```

**Learning:**
- Rails generators follow naming conventions (singular/plural)
- Generators create MVC components automatically
- Can customize generators with Thor or ERB templates
- Understanding generated code is key to mastering Rails

### 2. ActiveRecord Associations & Validations
**What We Did:**
- Implemented `has_many :comments, dependent: :destroy`
- Used `belongs_to :user` for associations
- Added `presence`, `length`, `uniqueness` validations
- Created custom validators for business logic

**Code Example:**
```ruby
class Blog < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  
  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 10 }
  
  validate :comments_only_for_published_blog, on: :update
end
```

**Learning:**
- Associations reduce N+1 queries when used with `includes`
- `dependent: :destroy` ensures referential integrity
- Custom validators encapsulate complex business rules
- Validation messages can be customized

### 3. Database Migrations
**What We Did:**
- Created migrations to add/remove columns
- Used migration helpers like `add_index`, `add_column`, `change_column`
- Explored reversible migrations for rollback support
- Managed schema evolution over time

**Key Migrations:**
```bash
rails generate migration AddPublishedToBlogs published:boolean
rails generate migration CreateComments blog:references user:references body:text
```

**Learning:**
- Migrations are version-controlled schema changes
- Always make migrations reversible for easy rollback
- Use proper indexing for foreign keys: `add_index :blogs, :user_id`
- `change_table` DSL for complex operations

### 4. RESTful Routing & Controllers
**What We Did:**
- Implemented 7 RESTful actions: index, show, new, create, edit, update, destroy
- Added custom routes for `publish` action
- Nested comments under blogs: `resources :blogs { resources :comments }`
- Verified routes using `rails routes`

**Routes File:**
```ruby
resources :blogs do
  resources :comments, only: [:create, :destroy]
  member do
    post :publish
  end
end
```

**Learning:**
- REST principles organize code logically
- Custom actions should be at `collection` or `member` level
- Nested routes create parent-child relationships
- Use `only`/`except` to limit generated routes

### 5. Strong Parameters
**What We Did:**
- Whitelist permitted parameters in controllers
- Used `require` and `permit` for security
- Nested parameter whitelisting for associations

**Code Example:**
```ruby
def blog_params
  params.require(:blog).permit(:title, :body, :published)
end

def comment_params
  params.require(:comment).permit(:body)
end
```

**Learning:**
- Strong parameters prevent mass assignment vulnerabilities
- Rails raises error if unpermitted parameters are used
- Nested attributes require special syntax: `comments_attributes: [:id, :body]`

### 6. Model Scopes & Query Methods
**What We Did:**
- Created scopes for filtering: `.published`, `.drafts`
- Used `where`, `find_by`, `limit`, `order` in queries
- Combined scopes for complex queries
- Explored differences between `includes` vs `eager_load`

**Code Example:**
```ruby
scope :published, -> { where(published: true) }
scope :recent, -> { order(created_at: :desc) }
scope :by_user, ->(user) { where(user_id: user.id) }

# Usage
Blog.published.recent.limit(10)
Blog.by_user(current_user).drafts
```

**Learning:**
- Scopes make queries readable and reusable
- `includes` uses LEFT OUTER JOIN, `eager_load` uses INNER JOIN
- Chain scopes for query composition
- `select` optimizes queries to fetch only needed columns

### 7. Devise Authentication
**What We Did:**
- Installed Devise gem and generated User model
- Configured authentication strategies
- Added password recovery via email
- Explored Devise controllers and views customization

**Setup Commands:**
```bash
bundle add devise
rails generate devise:install
rails generate devise User
rails generate devise:views
```

**Learning:**
- Devise handles password hashing, validation, sessions
- `current_user` is available in all controllers/views
- Customize Devise by generating views and controllers
- `authenticate_user!` redirects unauthenticated users

### 8. Authorization with Pundit
**What We Did:**
- Created policy classes for Blog and Comment
- Implemented `index?`, `show?`, `create?`, `update?`, `destroy?` methods
- Used `authorize` in controllers and `policy` in views
- Used `policy_scope` to filter visible records

**Code Example:**
```ruby
class BlogPolicy < ApplicationPolicy
  def update?
    record.user == user || user.admin?
  end
  
  def show?
    record.published? || record.user == user || user.admin?
  end
end

# In controller
def update
  authorize blog
  blog.update(blog_params)
end

# In view
<% if policy(blog).update? %>
  <%= link_to "Edit", edit_blog_path(blog) %>
<% end %>
```

**Learning:**
- Policies are just Ruby classes - simple and testable
- `policy_scope` filters record visibility
- Use `authorize` to check before action
- Policies integrate with Rails rescue system

### 9. Role-Based Authorization with CanCanCan
**What We Did:**
- Defined Ability class with roles
- Implemented admin and user role rules
- Used `authorize!` to enforce permissions
- Created ability definitions for blog and comment resources

**Code Example:**
```ruby
class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
      return
    end

    can :read, Blog, published: true
    can :read, Blog, user_id: user.id
    can :create, Blog
    can :update, Blog, user_id: user.id
  end
end
```

**Learning:**
- CanCanCan uses declarative style - easy to understand
- Combine with Pundit for view-level (`policy`) and controller-level (`authorize!`) checks
- Roles can be implemented as enums
- Test abilities with specific user scenarios

### 10. Service Objects for Business Logic
**What We Did:**
- Extracted blog publishing logic into PublishBlogService
- Kept controllers thin and models focused
- Made business logic testable and reusable

**Code Example:**
```ruby
class PublishBlogService
  def initialize(blog)
    @blog = blog
  end

  def call
    @blog.update!(published: true)
    NotificationMailer.blog_published(@blog).deliver_later
  end
end

# Usage
PublishBlogService.new(blog).call
```

**Learning:**
- Services separate complex business logic from models
- Single responsibility principle makes code maintainable
- Services are easy to test in isolation
- Use dependency injection for flexibility

### 11. Background Jobs with Solid Queue
**What We Did:**
- Created PublishBlogJob to automatically publish blogs 1 hour after creation
- Scheduled jobs with `perform_later`
- Configured Solid Queue for job persistence
- Explored `perform_now` vs `perform_later`

**Code Example:**
```ruby
class PublishBlogJob < ApplicationJob
  queue_as :default

  def perform(blog_id)
    blog = Blog.find(blog_id)
    PublishBlogService.new(blog).call
  end
end

# Schedule in controller
def create
  @blog = current_user.blogs.build(blog_params)
  if @blog.save
    PublishBlogJob.set(wait: 1.hour).perform_later(@blog.id)
  end
end
```

**Learning:**
- Background jobs improve user experience by deferring slow operations
- `perform_later` is asynchronous, `perform_now` is synchronous (useful for testing)
- Solid Queue is Rails 8's default - reliable and scalable
- Always use IDs for serialization, not full objects

### 12. Serializers for API Responses
**What We Did:**
- Created serializers for Blog, Comment, and User
- Included nested associations in serializers
- Customized attribute names and formatting

**Code Example:**
```ruby
class BlogSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :published, :created_at

  belongs_to :user
  has_many :comments
end

# Usage in controller
render json: @blog, serializer: BlogSerializer
```

**Learning:**
- Serializers provide consistent API responses
- `belongs_to` and `has_many` include nested resources
- Serializers help API versioning
- Use `except` to exclude sensitive attributes

### 13. Testing with RSpec & FactoryBot
**What We Did:**
- Set up RSpec for unit and integration tests
- Created factories for generating test data
- Used Faker for realistic data
- Wrote model, request, and policy tests

**Test Example:**
```ruby
describe Blog do
  describe "validations" do
    it "validates presence of title" do
      blog = build(:blog, title: nil)
      expect(blog).not_to be_valid
    end
  end

  describe "associations" do
    it "has many comments" do
      blog = create(:blog)
      create_list(:comment, 3, blog: blog)
      expect(blog.comments.count).to eq(3)
    end
  end
end
```

**Learning:**
- Tests are executable documentation
- Factories avoid repetitive test setup
- Use `build` for unsaved objects, `create` for saved
- Test both happy path and edge cases

### 14. N+1 Query Prevention
**What We Did:**
- Used `includes` to eager load associations
- Detected N+1 queries with Bullet gem
- Identified and fixed lazy-loaded relationships
- Optimized queries in controllers

**Code Example:**
```ruby
# ❌ N+1 Query - BAD
blogs = Blog.all
blogs.each { |blog| puts blog.user.email }  # 1 + N queries

# ✅ Eager Loading - GOOD
blogs = Blog.includes(:user)
blogs.each { |blog| puts blog.user.email }  # 2 queries total
```

**Learning:**
- `includes` uses a hash structure for nested associations
- `eager_load` forces INNER JOIN (excludes non-matching records)
- Bullet warns during development
- Profile queries using `explain` or Rails logs

### 15. Professional UI/UX Design
**What We Did:**
- Implemented Bootstrap 5 for responsive design
- Created custom CSS for modern aesthetics
- Built reusable view components with partials
- Designed beautiful authentication pages

**Design Principles Applied:**
- Mobile-first responsive design
- Consistent color scheme and typography
- Proper spacing and visual hierarchy
- Accessible form elements
- Clear call-to-action buttons
- Smooth transitions and animations

**Learning:**
- Bootstrap provides professional foundation
- Custom CSS adds personality and brand
- Partials reduce duplication
- Test responsive design on multiple devices

---

## Challenges & Solutions

### Challenge 1: Draft Blogs Not Visible

**Symptom:**
- `/blogs/drafts` showed "No blogs found" even though draft blogs existed in database
- Regular published blogs displayed correctly

**Root Cause:**
- User's blogs were created with `published: nil` instead of `false`
- Scope only checked for `published: false`
- Database had mixed null and false values

**Diagnosis:**
```ruby
# In Rails console
rails c

# Check what we had
Blog.where(published: nil).count  # => 5
Blog.where(published: false).count # => 0

# Test the problematic scope
Blog.where(published: false).to_sql
# => "SELECT `blogs`.* FROM `blogs` WHERE `blogs`.`published` = FALSE"

# This missed the nil values!
```

**Solution Implemented:**
```ruby
# Modified scope to include both false and nil
scope :drafts, -> { where(published: [false, nil]) }

# Added after_initialize callback for new blogs
after_initialize :set_default_published

def set_default_published
  self.published ||= false if new_record?
end
```

**Prevention:**
- Set database default for boolean columns: `t.boolean :published, default: false`
- Use database constraints: `NOT NULL`
- Validate state changes early

---

### Challenge 2: Sign-Out Broken with Turbo

**Symptom:**
- Clicking "Sign Out" showed error: "No route matches [GET] /users/sign_out"
- Only GET requests worked, DELETE failed
- Link helper wasn't sending correct HTTP method

**Root Cause:**
- Rails 8 uses Turbo for navigation
- Turbo requires different syntax than traditional Rails method: :delete
- Old syntax: `link_to "Sign Out", destroy_user_session_path, method: :delete`
- Turbo-compatible syntax: `data: { turbo_method: :delete }`

**Solution:**
```erb
<!-- OLD (doesn't work with Turbo) -->
<%= link_to "Sign Out", destroy_user_session_path, method: :delete, class: "nav-link" %>

<!-- NEW (Turbo-compatible) -->
<%= link_to "Sign Out", destroy_user_session_path, data: { turbo_method: :delete }, class: "nav-link" %>
```

**Learning:**
- Rails 8 migrations: understand new Turbo behavior
- `data: { turbo_method: :delete }` uses UJS beneath
- Test navigation thoroughly in development
- Check Rails version-specific documentation

---

### Challenge 3: Blog Cards Not Displaying User Email

**Symptom:**
- Blog cards showed published status and comment count
- User email was invisible or cut off in the layout
- Badges consumed too much horizontal space

**Root Cause:**
- Flexbox layout used `justify-content: space-between` without wrapping
- Long badge text pushed email off-screen
- No responsive handling for mobile

**Solution:**
```css
/* Updated CSS */
.blog-card-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 1rem;
  border-top: 1px solid var(--gray-border);
  font-size: 0.85rem;
  gap: 0.5rem;
  flex-wrap: wrap;  /* NEW: Allow wrapping */
}

.blog-card-author {
  color: #94a3b8;
  font-weight: 500;
  flex-shrink: 0;   /* NEW: Prevent squishing */
}
```

**Restructured HTML:**
```erb
<div class="blog-card-meta">
  <!-- Left: Author email (doesn't shrink) -->
  <small class="blog-card-author"><%= blog.user&.email %></small>
  
  <!-- Right: Badges and count -->
  <div class="d-flex gap-2 align-items-center">
    <span class="badge ...">Published/Draft</span>
    <span class="badge ..."><%= pluralize(blog.comments.count, "comment") %></span>
  </div>
</div>
```

**Testing:**
- Verified on desktop (1200px+)
- Tested on tablet (768-1024px)
- Checked mobile (< 768px)

---

### Challenge 4: Authorization Logic Complexity

**Symptom:**
- Multiple authorization systems could conflict
- Unclear which checks run at what stage
- Difficult to debug permission errors

**Solution:**
- Use Pundit for view-level authorization (`policy(resource)`)
- Use CanCanCan for controller-level authorization (`authorize! :action, resource`)
- Clear separation of concerns

**Implementation:**
```ruby
# Controller - Authorize first
def update
  @blog = Blog.find(params[:id])
  authorize! :update, @blog  # CanCanCan - controller level
  @blog.update(blog_params)
end

# View - Check permission before showing link
<% if policy(@blog).update? %>  <!-- Pundit - view level -->
  <%= link_to "Edit", edit_blog_path(@blog) %>
<% end %>
```

---

### Challenge 5: N+1 Query in Blog Listing

**Symptom:**
- Blog index page ran 50+ database queries
- Performance degraded with more blogs
- Bullet gem warned about N+1 queries

**Root Cause:**
```ruby
# Original code
@blogs = Blog.published
# Query 1: SELECT * FROM blogs WHERE published = true
# Queries 2-51: For each blog, SELECT * FROM users WHERE id = blog.user_id
```

**Solution:**
```ruby
# Fixed code
@blogs = Blog.published.includes(:user, :comments)
# Query 1: SELECT * FROM blogs WHERE published = true
# Query 2: SELECT * FROM users WHERE id IN (...)
# Query 3: SELECT * FROM comments WHERE blog_id IN (...)
# Total: 3 queries regardless of blog count
```

**Verification:**
```ruby
# Check query count
Blog.published.includes(:user, :comments).to_a
# => Executed 3 SQL queries
```

---

### Challenge 6: Login Page Not Rendering

**Symptom:**
- Screenshots showed plain Bootstrap form
- Expected beautiful two-column design not visible
- CSS changes weren't appearing

**Root Cause:**
- Browser cache had old CSS
- Rails cache had old view files
- Asset pipeline hadn't recompiled

**Solution:**
```bash
# Clear Rails cache
rails cache:clear
rm -rf tmp/cache/*

# Clear precompiled assets
rails assets:clobber

# Browser: Hard refresh
# Mac: Cmd + Shift + R
# Windows/Linux: Ctrl + Shift + Delete
```

**Prevention:**
- Document cache clearing steps
- Add cache busting to CSS (v=timestamp)
- Use Rails asset digests in production

---

### Challenge 7: Policy Scope Complexity

**Symptom:**
- Tried using `policy_scope(Blog).where(user_id: user.id)` in controller
- Got complex SQL with incorrect OR conditions
- Queries didn't work as expected

**Root Cause:**
```ruby
# problematic code
policy_scope(Blog).where(user_id: user.id)
# Pundit's policy_scope already combines conditions with OR
# Adding .where() creates complex nested conditions
```

**Solution:**
```ruby
# Use direct relationship instead
def drafts
  @blogs = current_user.blogs.drafts.includes(:user, :comments)
end

# or use policy_scope alone
def index
  @blogs = policy_scope(Blog).includes(:user, :comments)
end
```

**Learning:**
- Understand what `policy_scope` returns
- Don't combine `policy_scope` with additional `.where()` calls
- Use direct model relationships when possible
- Test with SQL inspection: `Model.query.to_sql`

---

### Challenge 8: Devise Password Recovery Configuration

**Symptom:**
- Users couldn't reset passwords
- Email notifications not sending
- Recovery token expiration unclear

**Solution:**
```ruby
# Configure Devise in config/initializers/devise.rb
Devise.setup do |config|
  # Email configuration
  config.mailer_sender = 'noreply@blogapp.com'
  
  # Password reset token valid for 6 hours
  config.reset_password_within = 6.hours
  
  # Remember me duration
  config.remember_for = 2.weeks
end

# In development, use letter_opener for email preview
# gem 'letter_opener', group: :development

# Configuration in development.rb
config.action_mailer.delivery_method = :letter_opener
```

---

### Challenge 9: Test Data Consistency

**Symptom:**
- Tests sometimes failed non-deterministically
- Faker generated same data occasionally
- Factory sequences caused conflicts

**Solution:**
```ruby
# Use sequences in factories
FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    role { :user }
  end

  factory :blog do
    sequence(:title) { |n| "Blog Post #{n}" }
    body { Faker::Lorem.paragraphs(number: 3).join("\n\n") }
    published { false }
    user
  end
end

# In tests - each object gets unique email
user1 = create(:user)  # user1@example.com
user2 = create(:user)  # user2@example.com
```

---

## Performance Optimizations

### 1. Database Indexing

**Applied Indexes:**
```ruby
# Foreign keys should have indexes
add_index :blogs, :user_id
add_index :comments, :blog_id
add_index :comments, :user_id
add_index :comments, [:blog_id, :user_id]  # Composite

# Status columns
add_index :blogs, :published
```

**Benefits:**
- Speeds up filtering: `Blog.where(user_id: 1)` 100x faster
- Improves JOIN performance
- Reduces full table scans

### 2. Eager Loading

**Before (N+1):**
```ruby
Blog.all.each { |b| puts b.user.name }  # 1 + N queries
```

**After (Eager):**
```ruby
Blog.includes(:user).each { |b| puts b.user.name }  # 2 queries
```

**Applied Across:**
- Blog controller index: `includes(:user, :comments)`
- Blog controller show: `includes(:comments, :user)`
- Comment display: `includes(:user)`

### 3. Select Only Needed Columns

```ruby
# When not needed full records
blogs = Blog.select(:id, :title, :created_at)

# For API responses
blogs = Blog.select('id, title, created_at, user_id').includes(:user)
```

### 4. Database Query Optimization

**Good Practice:**
```ruby
# Use select for specific columns
active_blogs = Blog.select(:id, :title, :body)
  .where(published: true)
  .limit(20)

# Use pluck for single column
user_ids = Blog.pluck(:user_id)  # Returns array, not ActiveRecord
```

**Avoid:**
```ruby
# ❌ Loads all objects into memory
User.all.map { |u| u.id }

# ✅ Returns array directly
User.pluck(:id)
```

### 5. Caching Strategies

**Fragment Caching:**
```erb
<% cache ["blog", @blog, @blog.updated_at] do %>
  <%= render "blog_details", blog: @blog %>
<% end %>
```

**Query Caching:**
```ruby
# Rails caches identical queries in same request
User.find(1)  # Hits database
User.find(1)  # Returns from cache
```

### 6. Monitoring with Bullet

**Configuration:**
```ruby
# config/initializers/bullet.rb
Bullet.enable = true
Bullet.rails_logger = true
Bullet.alert = true
Bullet.bullet_logger = true
```

**Usage:**
- Watch Rails logs for N+1 warnings
- Add `includes` based on warnings
- Re-run to verify fixes

### 7. Asset Pipeline Optimization

**Production Build:**
```bash
rails assets:precompile RAILS_ENV=production
```

**Results:**
- CSS/JS minified and combined
- Assets versioned with digest
- CDN-ready file naming

---

## Deployment

### Prerequisites
- PostgreSQL database (SQLite not recommended for production)
- Ruby 3.3.0+
- Server with 1GB+ RAM
- Domain name with SSL certificate

### Environment Setup

```bash
# 1. Create production credentials
EDITOR=nano rails credentials:edit --environment=production

# Add:
# secret_key_base: [generate with `rails secret`]
# database:
#   password: [strong password]
# smtp:
#   user_name: [email]
#   password: [app password]
```

### Docker Deployment

```bash
# Build image
docker build -t blog-app:latest .

# Run container
docker run -d \
  -p 3000:3000 \
  -e RAILS_ENV=production \
  -e RAILS_MASTER_KEY=$RAILS_MASTER_KEY \
  blog-app:latest

# With Docker Compose
docker-compose up -d
```

### Heroku Deployment

```bash
# Create Procfile
echo "web: bundle exec puma -t 5:5 -p \${PORT:-3000}" > Procfile

# Deploy
git push heroku main

# Migrate database
heroku run rails db:migrate

# View logs
heroku logs --tail
```

### Database Backup

```bash
# PostgreSQL backup
pg_dump production_db > backup.sql

# Restore
psql production_db < backup.sql
```

### Monitoring

```bash
# Application Performance Monitoring
gem "newrelic_rpm"
gem "sentry-rails"

# Setup in initializers and environment variables
```

---

## Troubleshooting

### Issue: "Couldn't find Blog with 'id'=1"

```bash
# Check database has data
rails c
Blog.count  # Should return > 0

# If empty, seed the database
rails db:seed
```

### Issue: "PG::ConnectionBad"

```bash
# Check database service is running
sudo service postgresql status

# Or for Docker
docker-compose ps
```

### Issue: "undefined method `comments_count'"

```bash
# Run migrations
rails db:migrate

# Check schema
rails db:schema:dump
```

### Issue: Tests failing with "user is required"

```ruby
# Ensure factories have all required fields
build(:blog)  # Fails - user is required
create(:blog, user: user)  # Works
```

### Issue: "ActiveJob::JobArgumentSerializationError"

```ruby
# ❌ Wrong - passing object
PublishBlogJob.perform_later(@blog)

# ✅ Correct - passing ID
PublishBlogJob.perform_later(@blog.id)
```

---

## Useful Commands

### Rails Console
```bash
rails c

# Explore models
user = User.first
user.blogs.count
user.blogs.published.to_a

# Test validations
blog = Blog.new(title: "Test")
blog.valid?  # => false
blog.errors.full_messages

# Mass data operations
Blog.update_all(published: false)
Blog.destroy_all
```

### Database
```bash
# Migrations
rails db:migrate
rails db:rollback
rails db:migrate:status

# Seeds
rails db:seed
rails db:reset  # Drop, create, migrate, seed

# Schema
rails db:schema:dump
```

### Testing
```bash
# Full suite
bundle exec rspec

# Specific file
bundle exec rspec spec/models/blog_spec.rb

# Specific test
bundle exec rspec spec/models/blog_spec.rb:10

# With coverage
COVERAGE=true bundle exec rspec
```

### Security
```bash
# Check for vulnerabilities
bundler audit
brakeman --run-all-checks
rubocop --auto-correct
```

### Assets
```bash
# Precompile
rails assets:precompile

# Clean
rails assets:clobber

# Digest versions
rails assets:precompile RAILS_ENV=production
```

---

## Additional Resources

### Official Documentation
- [Rails Guides](https://guides.rubyonrails.org)
- [Rails API](https://api.rubyonrails.org)
- [Devise Documentation](https://github.com/heartcombo/devise)
- [Pundit](https://github.com/varvet/pundit)
- [CanCanCan](https://github.com/CanCanCommunity/cancancan)

### Learning Materials
- [Rails Security Guide](https://guides.rubyonrails.org/security.html)
- [Active Record Query Interface](https://guides.rubyonrails.org/active_record_querying.html)
- [Testing Guide](https://guides.rubyonrails.org/testing.html)

### Community
- [Ruby on Rails Forum](https://discuss.rubyonrails.org)
- [Stack Overflow - Rails tag](https://stackoverflow.com/questions/tagged/ruby-on-rails)
- [Ruby Community](https://www.ruby-community.org)

---

## License

This project is for educational purposes. Created as part of comprehensive Rails training.

## Author

Created as a comprehensive training project for mastering modern Rails development patterns and best practices.

---

**Last Updated**: January 18, 2026

For questions or improvements, refer to the [TRAINING_CHECKLIST_COMPLETION.md](TRAINING_CHECKLIST_COMPLETION.md) for detailed implementation notes.
