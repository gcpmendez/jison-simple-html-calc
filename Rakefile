desc "compile calculator.jison"
task :default => 'calculator.js'
file %q{calculator.js} do
  sh "jison calculator.jison calculator.l -o calculator.js"
end

desc "compile postfix.jison"
task :postfix => 'postfix.js'
file %q{postfix.js} do
  sh "jison postfix.jison calculator.l -o postfix.js"
end

desc "open github repo page in the browser"
task :openrepo do
  sh "open https://github.com/crguezl/jison-simple-html-calc"
end

desc "open gh-page in the browser"
task :open do
  sh "open http://crguezl.github.io/jison-simple-html-calc/"
end
