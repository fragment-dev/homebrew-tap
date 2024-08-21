require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5526.0.0-darwin-x64.tar.gz"
    sha256 "bb0bbef44d745573a5d13e4ae86bdfa241b001489c554f4a8b7f8e356532a4ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5526.0.0-darwin-arm64.tar.gz"
      sha256 "da74a4c01565418943813c13e32abb08395305ea28d18c2b9c6b0ac3d1b82265"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5526.0.0-linux-x64.tar.gz"
    sha256 "64d2049e988b7b018c461288964af9f4da27495195b57b4d4ac136c50c49a0b7"
  end
  version "5526.0.0"
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
