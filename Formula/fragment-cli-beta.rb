require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5491.0.0-darwin-x64.tar.gz"
    sha256 "275871eee95d9ea8eaf356227b4967b49e90097410ed7d780f32e09f262221ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5491.0.0-darwin-arm64.tar.gz"
      sha256 "7b4a5eb8975883316f8f97083cafdfde98e9c5fc487226e6a17bb12b25da0048"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5491.0.0-linux-x64.tar.gz"
    sha256 "d54398e3a089ef252f2fa405820e384799b56523861c96d132fcf59a245d2973"
  end
  version "5491.0.0"
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
