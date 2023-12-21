require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4195.0.0-darwin-x64.tar.gz"
    sha256 "d0750beb0066bb6915fd2be0185b581ee712e05c195ac28e6ee0de3ab5e805c7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4195.0.0-darwin-arm64.tar.gz"
      sha256 "c4bc86fd329c3f4d12d55d36721365366258f39c6b7b0261e24be0b53c961bff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4195.0.0-linux-x64.tar.gz"
    sha256 "f675465bbb91bd430f047d4fe6a4790cefca5aa79a8ac6978e1a71b14e0e74e4"
  end
  version "4195.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
