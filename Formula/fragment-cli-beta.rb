require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5086.0.0-darwin-x64.tar.gz"
    sha256 "0dc51ba4f2417e4a40d446aa9350e42a03757436b5a165aa18e9d4c6adf4856c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5086.0.0-darwin-arm64.tar.gz"
      sha256 "788e3a1854d5bfe68a0bec4879b42565e4094734abf25a1ac59ee17ff698155d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5086.0.0-linux-x64.tar.gz"
    sha256 "1a239cdfe8b5a2dc394ffa5ae8219a2efe40059a10ac11ba433fae2512d38db1"
  end
  version "5086.0.0"
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
