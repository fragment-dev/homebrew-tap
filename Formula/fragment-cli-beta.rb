require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6022.0.0-darwin-x64.tar.gz"
    sha256 "9aa8075fda0973a2d7a1d5f302a5a72daab6e63843817377ba2b2e450a7be2c7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6022.0.0-darwin-arm64.tar.gz"
      sha256 "3ceb909d68b3ad1bfd5d9d5863476c07c2286266c6b8ad37389c36eb82708399"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6022.0.0-linux-x64.tar.gz"
    sha256 "f556dac5c18fd2cae6aa8b34c1a000d09101ca4665d30203c1784f6b0da53554"
  end
  version "6022.0.0"
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
