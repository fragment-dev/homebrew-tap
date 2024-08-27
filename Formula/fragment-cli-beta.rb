require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5545.0.0-darwin-x64.tar.gz"
    sha256 "6448ad8441f58c8eb0ff7f985fc57d96ab8e71243969022ab1dd9c95f9128f94"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5545.0.0-darwin-arm64.tar.gz"
      sha256 "527769e7fedd53aba8f64695c072c0f10039e4749179db98b5c7407800fb720e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5545.0.0-linux-x64.tar.gz"
    sha256 "b495e991826f9339f6a8e1054e08e489613070a1d9f1831c163da2cdc0fd6396"
  end
  version "5545.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
