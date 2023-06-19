require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2873.0.0-darwin-x64.tar.gz"
    sha256 "3083f22d7f80d04790ba70e6d3636f85fbb5b9b9ae25b2f6c87e51ddd3c2c8fc"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2873.0.0-darwin-arm64.tar.gz"
      sha256 "7963953e2e3890d0f53167a26c49b951ae94e30d77d0102196f4b2fb59b487a1"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2873.0.0-linux-x64.tar.gz"
    sha256 "e4c0117f818ceeaf60224e289e7e6f52433e067d296c815dc7f166d120a8b72e"
  end
  version "2873.0.0"
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
