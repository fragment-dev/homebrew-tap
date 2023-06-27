require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2943.0.0-darwin-x64.tar.gz"
    sha256 "9926e7b273a7550c9ac2b26cd11ed7bc89d7d233d17163e5002ce43189ca446c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2943.0.0-darwin-arm64.tar.gz"
      sha256 "8c78cd3adffc102c7663ad751f16b9b5fca53b8bca7dd283302c79632a365708"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2943.0.0-linux-x64.tar.gz"
    sha256 "7c0e1488d41e2ddfadfb79778b78e10a326405dad671f36e56c4edc768399f51"
  end
  version "2943.0.0"
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
