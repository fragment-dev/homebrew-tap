require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3083.0.0-darwin-x64.tar.gz"
    sha256 "295767a0ffdb9b84b92865c981106dac0839b2e2ccf40c5a0cc10c4fd2f61972"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3083.0.0-darwin-arm64.tar.gz"
      sha256 "0ccadbc0528bcab633af39a1f96cfc91a6cf7245d0a661f10dfa1c8836c6afb6"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3083.0.0-linux-x64.tar.gz"
    sha256 "60663c2b3f178bcf7a586c7ffcf1816d5e4fc59e028e3de09108c540acb274bf"
  end
  version "3083.0.0"
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
