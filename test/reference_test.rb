$LOAD_PATH << File.expand_path(File.dirname(File.realpath(__FILE__)) + '/..')
require File.expand_path('lib/refworks.rb')
require "test/unit"
require "minitest/reporters"
MiniTest::Reporters.use!

#noinspection RubyInstanceMethodNamingConvention,RubyStringKeysInHashInspection
class ReferenceTest < Test::Unit::TestCase
  def test_empty_reference_creation
    ref = Reference.new({})
    assert ref.instance_of?(Reference)
  end

  def test_reference_creation_using_httparty_parsed_reference
    ref = Reference.new({"id"=> %w(31932 31932),
                         "rt"=>{"typeOrd"=>"0", "__content__"=>"Generic"},
                         "a1"=>["Ozabaci,Deniz", "Henderson,Daniel J."],
                         "t1"=>
                             "Gradients via Oracle Estimation for Additive Nonparametric Regression with Application to Returns to Schooling",
                         "k1"=>["Race and Ethnicity", "Education", "Gender"],
                         "ab"=>
                             "In this paper we extend the nonparametric additive oracle regression estimator of Kim et al. (1999) by analyzing the gradients of the conditional mean function as these are of primary interest in applied economic research. We derive the asymptotic results for the gradients under both independence and weak-dependence assumptions. Finite sample performance is examined via Monte Carlo simulations. We further propose methods to allow for interactions as well as a partially linear model. We take this extended model, with recent U.S. Current Population Survey data, to analyze returns to schooling. Similar to previous research, we find that blacks and Hispanics have higher rates of return on average. However, for married males, while non-Hispanic whites have lower returns on average, they typically possess the highest returns in the sample. For females, we are able to show that Hispanics have uniformly higher returns over non-Hispanic whites for the full sample. When we restrict our analysis to females whose highest level of education is a high-school diploma, we find average, but no longer uniformly higher returns. However, these uniformly higher returns resurface for college graduates.",
                         "sr"=>"Electronic(1)",
                         "ol"=>"Unknown(0)",
                         "cd"=>"1354927763000",
                         "md"=>"1354927764000"})
    assert ref.instance_of?(Reference)
  end

  def test_reference_field_population
    ref = Reference.new({"id"=> %w(31932 31932),
                         "rt"=>{"typeOrd"=>"0", "__content__"=>"Generic"},
                         "a1"=>["Ozabaci,Deniz", "Henderson,Daniel J."],
                         "t1"=>
                             "Gradients via Oracle Estimation for Additive Nonparametric Regression with Application to Returns to Schooling",
                         "k1"=>["Race and Ethnicity", "Education", "Gender"],
                         "ab"=>
                             "In this paper we extend the nonparametric additive oracle regression estimator of Kim et al. (1999) by analyzing the gradients of the conditional mean function as these are of primary interest in applied economic research. We derive the asymptotic results for the gradients under both independence and weak-dependence assumptions. Finite sample performance is examined via Monte Carlo simulations. We further propose methods to allow for interactions as well as a partially linear model. We take this extended model, with recent U.S. Current Population Survey data, to analyze returns to schooling. Similar to previous research, we find that blacks and Hispanics have higher rates of return on average. However, for married males, while non-Hispanic whites have lower returns on average, they typically possess the highest returns in the sample. For females, we are able to show that Hispanics have uniformly higher returns over non-Hispanic whites for the full sample. When we restrict our analysis to females whose highest level of education is a high-school diploma, we find average, but no longer uniformly higher returns. However, these uniformly higher returns resurface for college graduates.",
                         "sr"=>"Electronic(1)",
                         "ol"=>"Unknown(0)",
                         "cd"=>"1354927763000",
                         "md"=>"1354927764000"})
    assert_equal(ref.id, "31932")
    assert_equal(ref.rt, {"typeOrd"=>"0", "__content__"=>"Generic"})
    assert_equal(ref.a1, ["Ozabaci,Deniz", "Henderson,Daniel J."])
    assert_equal(ref.t1, "Gradients via Oracle Estimation for Additive Nonparametric Regression with Application to Returns to Schooling")
    assert_equal(ref.k1, ["Race and Ethnicity", "Education", "Gender"])
    assert_equal(ref.ab, "In this paper we extend the nonparametric additive oracle regression estimator of Kim et al. (1999) by analyzing the gradients of the conditional mean function as these are of primary interest in applied economic research. We derive the asymptotic results for the gradients under both independence and weak-dependence assumptions. Finite sample performance is examined via Monte Carlo simulations. We further propose methods to allow for interactions as well as a partially linear model. We take this extended model, with recent U.S. Current Population Survey data, to analyze returns to schooling. Similar to previous research, we find that blacks and Hispanics have higher rates of return on average. However, for married males, while non-Hispanic whites have lower returns on average, they typically possess the highest returns in the sample. For females, we are able to show that Hispanics have uniformly higher returns over non-Hispanic whites for the full sample. When we restrict our analysis to females whose highest level of education is a high-school diploma, we find average, but no longer uniformly higher returns. However, these uniformly higher returns resurface for college graduates.")
    assert_equal(ref.sr, "Electronic(1)")
    assert_equal(ref.ol, "Unknown(0)")
    assert_equal(ref.cd, "1354927763000")
    assert_equal(ref.md, "1354927764000")

  end

  def test_reference_field_aliases_and_extensions
    ref = Reference.new({"id"=> %w(31932 31932),
                         "rt"=>{"typeOrd"=>"0", "__content__"=>"Generic"},
                         "a1"=>["Ozabaci,Deniz", "Henderson,Daniel J."],
                         "t1"=>
                             "Gradients via Oracle Estimation for Additive Nonparametric Regression with Application to Returns to Schooling",
                         "k1"=>["Race and Ethnicity", "Education", "Gender"],
                         "ab"=>
                             "In this paper we extend the nonparametric additive oracle regression estimator of Kim et al. (1999) by analyzing the gradients of the conditional mean function as these are of primary interest in applied economic research. We derive the asymptotic results for the gradients under both independence and weak-dependence assumptions. Finite sample performance is examined via Monte Carlo simulations. We further propose methods to allow for interactions as well as a partially linear model. We take this extended model, with recent U.S. Current Population Survey data, to analyze returns to schooling. Similar to previous research, we find that blacks and Hispanics have higher rates of return on average. However, for married males, while non-Hispanic whites have lower returns on average, they typically possess the highest returns in the sample. For females, we are able to show that Hispanics have uniformly higher returns over non-Hispanic whites for the full sample. When we restrict our analysis to females whose highest level of education is a high-school diploma, we find average, but no longer uniformly higher returns. However, these uniformly higher returns resurface for college graduates.",
                         "sr"=>"Electronic(1)",
                         "ol"=>"Unknown(0)",
                         "cd"=>"1354927763000",
                         "md"=>"1354927764000"})

    assert_equal(ref.rt_num, "0")
    assert_equal(ref.rt_string, "Generic")
    assert_equal(ref.authors, ["Ozabaci,Deniz", "Henderson,Daniel J."])
    assert_equal(ref.title, "Gradients via Oracle Estimation for Additive Nonparametric Regression with Application to Returns to Schooling")
    assert_equal(ref.keywords, ["Race and Ethnicity", "Education", "Gender"])
    assert_equal(ref.abstract, "In this paper we extend the nonparametric additive oracle regression estimator of Kim et al. (1999) by analyzing the gradients of the conditional mean function as these are of primary interest in applied economic research. We derive the asymptotic results for the gradients under both independence and weak-dependence assumptions. Finite sample performance is examined via Monte Carlo simulations. We further propose methods to allow for interactions as well as a partially linear model. We take this extended model, with recent U.S. Current Population Survey data, to analyze returns to schooling. Similar to previous research, we find that blacks and Hispanics have higher rates of return on average. However, for married males, while non-Hispanic whites have lower returns on average, they typically possess the highest returns in the sample. For females, we are able to show that Hispanics have uniformly higher returns over non-Hispanic whites for the full sample. When we restrict our analysis to females whose highest level of education is a high-school diploma, we find average, but no longer uniformly higher returns. However, these uniformly higher returns resurface for college graduates.")
  end

end