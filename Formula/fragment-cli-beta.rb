require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2289.0.0-darwin-x64.tar.gz"
    sha256 "e95d76b9a843d7ba5b72834599e750ca0cccd9b8ae38c141ca23070ddd161c49"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2289.0.0-darwin-arm64.tar.gz"
      sha256 "c987238212bf23c540d27d380ad15644f21776f47dc1e48f72dfa8f2d177abd8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2289.0.0-linux-x64.tar.gz"
    sha256 "f8e35093266122ea2b4aaee7fc87d9785059a952205275ff567cb18e15b414c0"
  end
  version "2289.0.0"
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
