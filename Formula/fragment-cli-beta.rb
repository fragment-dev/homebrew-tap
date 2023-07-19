require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3124.0.0-darwin-x64.tar.gz"
    sha256 "3c76eb5e9ba09ba21242f149d3fb4ce5c611209949f785fe8f28596b1c618ce7"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3124.0.0-darwin-arm64.tar.gz"
      sha256 "0d642dda6fdaeb11bef15e165221727646094cc866eadad65eb5bcd685ec0b1d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3124.0.0-linux-x64.tar.gz"
    sha256 "574a80bbcf4c2c15f3a48b22158194685bc10a1af1b33e80449f6c63b6d0b525"
  end
  version "3124.0.0"
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
