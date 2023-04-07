require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2377.0.0-darwin-x64.tar.gz"
    sha256 "cabd888afdb35cec8dfb92a7788cddf7a94d5156d3573507a65f5c963ba0278f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2377.0.0-darwin-arm64.tar.gz"
      sha256 "e0085d6d8eff26dd4db0bbec752b4526b2c6362fe9e3b78cf7cb63bbfeb99bba"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2377.0.0-linux-x64.tar.gz"
    sha256 "1f6c3937e1b0e67e329e10460e51fa2a3bcbd37e9a2e3a09c08a11b7cece3eb3"
  end
  version "2377.0.0"
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
