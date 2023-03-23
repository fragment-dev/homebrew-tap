require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2268.0.0-darwin-x64.tar.gz"
    sha256 "a191ef2c247d19d5a81bd349bf349f686e0f8de717de893c8190c3f9e0e899a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2268.0.0-darwin-arm64.tar.gz"
      sha256 "a5214a282d704cb250ffc699562a069b1c1d9dc393d91764f6f3b7c6773efe96"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2268.0.0-linux-x64.tar.gz"
    sha256 "40de8855c226ce67fbcb16a66a64dfed9f92aaaa7139e50dff13f51f5bf1273c"
  end
  version "2268.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
