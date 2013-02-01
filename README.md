SpreeMenu
=========

Add dynamic menu for Spree Commerce Shop


Basic Installation
------------------

1. Add the following to your Gemfile
<pre>
  gem 'spree_menu', :git => 'git://github.com/rdegan/spree_menu.git'
</pre>
2. Run `bundle install`
3. To copy and apply migrations run:
<pre>
	rails g spree_menu:install
</pre>

Example
=======

1. add menu helper method in your view:
<pre>
	<%= insert_menu %>
</pre>
and add menu in the admin section
2. Additional options:
<pre>
	<%= insert_menu(:category => "my_category") %>
</pre>
displays menu for which the category column, dafault is ""
<pre>
	<%= insert_menu(:class => "your_class", :id => "your_id") %>
</pre>
set menu class (default listing menu) and id (default header_menu)


Copyright (c) 2012 [Riccardo Degan], released under the New BSD License
